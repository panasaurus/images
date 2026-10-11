#!/usr/bin/env python3
"""Verify .github/images.json is in sync with the filesystem.

Guards enforced:
  1. every Dockerfile in the repo has a registry entry, and vice versa
  2. image names are unique, lowercase and tag-safe
  3. aliases and dependency groups reference existing entities
  4. contexts and platform strings are valid
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
REGISTRY_FILE = ROOT / ".github" / "images.json"

errors = []


def err(msg):
    errors.append(msg)


def main():
    registry = json.loads(REGISTRY_FILE.read_text())
    groups = registry.get("groups", [])
    if not groups:
        err("images.json has no groups")

    entries = {}
    alias_owners = {}
    for g in groups:
        gname = g.get("name", "<unnamed>")
        if not g.get("paths"):
            err(f"group {gname}: missing paths")
        for img in g.get("images", []):
            name = img.get("name", "")
            if name in entries:
                err(f"duplicate image name: {name}")
            entries[name] = img

            if not re.fullmatch(r"[a-z0-9][a-z0-9._-]*", name):
                err(f"image {name}: name is not tag-safe (lowercase, [a-z0-9._-])")
            if not (ROOT / img.get("file", "")).is_file():
                err(f"image {name}: Dockerfile not found: {img.get('file')}")
            if not (ROOT / img.get("context", "")).is_dir():
                err(f"image {name}: context not found: {img.get('context')}")
            platforms = img.get("platforms", "")
            plats = [p.strip() for p in platforms.split(",") if p.strip()]
            if not plats:
                err(f"image {name}: no platforms")
            for p in plats:
                if p not in ("linux/amd64", "linux/arm64"):
                    err(f"image {name}: invalid platform: {p}")
            for alias in img.get("aliases", []):
                if alias in entries:
                    err(f"image {name}: alias {alias} collides with a real image name")
                alias_owners.setdefault(alias, []).append(name)
                if not re.fullmatch(r"[a-z0-9][a-z0-9._-]*", alias):
                    err(f"image {name}: alias {alias} is not tag-safe")
            for dep in img.get("after", []):
                if dep not in {gg["name"] for gg in groups}:
                    err(f"image {name}: dependency group {dep} does not exist")

    for alias, owners in alias_owners.items():
        if len(owners) > 1:
            err(f"alias {alias} declared by multiple images: {', '.join(owners)}")

    on_disk = {
        str(p.relative_to(ROOT)) for p in ROOT.rglob("Dockerfile")
        if "scripts" not in p.relative_to(ROOT).parts
    }
    registered = {img["file"] for img in entries.values()}
    for missing in sorted(on_disk - registered):
        err(f"Dockerfile on disk but missing from images.json: {missing}")
    for phantom in sorted(registered - on_disk):
        err(f"in images.json but no Dockerfile on disk: {phantom}")

    if errors:
        print(f"matrix verification FAILED ({len(errors)} error(s)):")
        for e in errors:
            print(f"  - {e}")
        sys.exit(1)
    print(f"matrix OK: {len(entries)} images, {len(groups)} groups")


if __name__ == "__main__":
    main()
