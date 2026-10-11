#
# Copyright (c) 2026 Panasaurus
# Copyright (c) 2021 Matthew Penner
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
#

FROM --platform=linux/amd64 debian:bookworm-slim

LABEL org.opencontainers.image.title="panasaurus/images:rust"
LABEL org.opencontainers.image.description="Panasaurus image for Rust dedicated servers (Oxide/Carbon ready)"
LABEL org.opencontainers.image.url="https://github.com/panasaurus/images"
LABEL org.opencontainers.image.source="https://github.com/panasaurus/images"
LABEL org.opencontainers.image.vendor="Panasaurus"
LABEL org.opencontainers.image.licenses=MIT

ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# System dependencies and 32-bit game libraries
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gnupg \
        iproute2 \
        lib32gcc-s1 \
        lib32stdc++6 \
        libgdiplus \
        libsdl2-2.0-0:i386 \
        tzdata \
        unzip \
    && update-ca-certificates \
    && mkdir -p /etc/apt/keyrings \
    && curl -fsSL \
        https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
        | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && chmod 644 /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" \
        > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js WebSocket dependency
WORKDIR /node_modules

RUN npm install --no-audit --no-fund --no-save ws \
    && npm cache clean --force \
    && useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY --chmod=755 --chown=root:root ./entrypoint.sh /entrypoint.sh
COPY --chmod=755 --chown=root:root ./wrapper.js /wrapper.js

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
