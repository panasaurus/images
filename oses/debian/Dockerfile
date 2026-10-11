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

LABEL       org.opencontainers.image.title="panasaurus/images:debian"
LABEL       org.opencontainers.image.description="Panasaurus base OS image (Debian Bookworm) with common runtime libraries"
LABEL       org.opencontainers.image.url="https://github.com/panasaurus/images"
LABEL       org.opencontainers.image.source="https://github.com/panasaurus/images"
LABEL       org.opencontainers.image.vendor="Panasaurus"
LABEL       org.opencontainers.image.licenses=MIT

ENV         DEBIAN_FRONTEND=noninteractive

# Package mapping vs. the old buster-based upstream image:
#   libicu63 -> libicu72, libmariadbclient-dev -> libmariadb-dev,
#   libduktape203 -> libduktape207, liblua5.3 -> liblua5.3-0 + liblua5.3-dev,
#   libz-dev -> zlib1g-dev, netcat -> netcat-openbsd, telnet -> inetutils-telnet.
# apt-transport-https is built into modern apt and libgcc1 is pulled in by gcc.
RUN         apt-get update \
            && apt-get install -y --no-install-recommends \
                binutils \
                cabextract \
                ca-certificates \
                curl \
                ffmpeg \
                g++ \
                gcc \
                gdb \
                git \
                gnupg2 \
                icu-devtools \
                inetutils-telnet \
                iproute2 \
                libatomic1 \
                libc++-dev \
                libduktape207 \
                libfontconfig \
                libicu72 \
                liblua5.3-0 \
                liblua5.3-dev \
                liblzo2-2 \
                libmariadb-dev \
                libsdl1.2debian \
                libsdl2-2.0-0 \
                libsqlite3-dev \
                libssl-dev \
                libunwind8 \
                locales \
                net-tools \
                netcat-openbsd \
                rapidjson-dev \
                software-properties-common \
                sqlite3 \
                tar \
                tzdata \
                unzip \
                wget \
                xz-utils \
                zip \
                zlib1g-dev \
            && rm -rf /var/lib/apt/lists/* \
            && update-locale lang=en_US.UTF-8 \
            && dpkg-reconfigure --frontend noninteractive locales \
            && useradd -m -d /home/container -s /bin/bash container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        --chmod=755 --chown=root:root ./entrypoint.sh /entrypoint.sh
ENTRYPOINT  [ "/bin/bash", "/entrypoint.sh" ]
