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
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

FROM        --platform=$TARGETOS/$TARGETARCH debian:bookworm-slim

LABEL       org.opencontainers.image.title="panasaurus/images:rust"
LABEL       org.opencontainers.image.description="Panasaurus image for Rust dedicated servers (Oxide/Carbon ready)"
LABEL       org.opencontainers.image.url="https://github.com/panasaurus/images"
LABEL       org.opencontainers.image.source="https://github.com/panasaurus/images"
LABEL       org.opencontainers.image.vendor="Panasaurus"
LABEL       org.opencontainers.image.licenses=MIT

ENV         DEBIAN_FRONTEND=noninteractive

SHELL       [ "/bin/bash", "-o", "pipefail", "-c" ]

RUN         dpkg --add-architecture i386 \
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
            && rm -rf /var/lib/apt/lists/* \
            && mkdir -p /etc/apt/keyrings \
            && curl -fsSL 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9FD3B784BC1C6FC31A8A0A1C1655A0AB68576280' | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
            && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x bookworm main" > /etc/apt/sources.list.d/nodesource.list \
            && printf "Package: nodejs\nPin: origin deb.nodesource.com\nPin-Priority: 1001\n" > /etc/apt/preferences.d/nodesource \
            && apt-get update \
            && apt-get install -y --no-install-recommends nodejs \
            && rm -rf /var/lib/apt/lists/* \
            && mkdir /node_modules \
            && npm install --no-audit --no-fund --prefix / ws \
            && npm cache clean --force \
            && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        --chmod=755 --chown=root:root ./entrypoint.sh /entrypoint.sh
COPY        --chmod=755 --chown=root:root ./wrapper.js /wrapper.js

ENTRYPOINT  [ "/bin/bash", "/entrypoint.sh" ]
