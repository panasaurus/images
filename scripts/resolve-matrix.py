#!/usr/bin/env python3
"""Resolve which Pelecanus images a CI run should build.

Inputs (via env/args set by the workflow):
  --event      push | schedule | workflow_dispatch
  --groups     JSON array of changed path groups (from dorny/paths-filter)
  --images     optional comma-separated allowlist of image names
  --force-all  build every image regardless of change detection

Prints {"independent": [...], "dependent": [...]}.
"dependent" images (hytale) build in a second wave after their base groups.
"""
import argparse
import json
import sys
from pathlib import Path

REGISTRY_FILE = Path(__file__).resolve().parents[1] / ".github" / "images.json"


def parse_args():
    ap = argparse.ArgumentParser()
    ap.add_argument("--event", default="push")
    ap.add_argument("--groups", default="[]")
    ap.add_argument("--images", default="")
    ap.add_argument("--force-all", default="false")
    return ap.parse_args()


def main():
    args = parse_args()
    registry = json.loads(REGISTRY_FILE.read_text())
    groups = registry["groups"]

    all_images = [img for g in groups for img in g["images"]]
    by_name = {img["name"]: img for img in all_images}
    group_by_name = {img["name"]: g["name"] for g in groups for img in g["images"]}

    changed = json.loads(args.groups) if args.groups else []

    selected_groups = set()
    if args.force_all.lower() == "true" or args.event in ("schedule", "workflow_dispatch"):
        selected_groups = {g["name"] for g in groups}
    else:
        selected_groups = set(changed)
        if "ci" in selected_groups:
            # CI/tooling changes affect every image: rebuild all.
            selected_groups = {g["name"] for g in groups}

    selected = [img for g in groups if g["name"] in selected_groups for img in g["images"]]

    if args.images.strip():
        requested = [n.strip() for n in args.images.split(",") if n.strip()]
        unknown = [n for n in requested if n not in by_name]
        if unknown:
            print(f"ERROR: unknown image names: {', '.join(unknown)}", file=sys.stderr)
            print(f"available: {', '.join(sorted(by_name))}", file=sys.stderr)
            sys.exit(2)
        selected = [by_name[n] for n in requested]

    def with_tags(img):
        out = dict(img)
        tags = [f'{registry["registry"]}:{img["name"]}']
        tags += [f'{registry["registry"]}:{a}' for a in img.get("aliases", [])]
        out["tags"] = tags
        return out

    independent = [with_tags(i) for i in selected if "after" not in i]
    dependent = [with_tags(i) for i in selected if "after" in i]

    print(json.dumps({"independent": independent, "dependent": dependent}))


if __name__ == "__main__":
    main()
