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

# Hard coded specific Java version to fix issue with manifest constructor class in
# newer Java versions breaking all modpacks and versions that are not using the
# latest Forge release. This should be removed when the manifest constructor class
# issue is backported or if Forge decides to abandon old versions and we need
# newer Java versions.
#
# @see https://github.com/McModLauncher/modlauncher/issues/91


FROM        --platform=$TARGETOS/$TARGETARCH eclipse-temurin:8u312-b07-jdk-focal

LABEL       org.opencontainers.image.title="panasaurus/images:java_8"
LABEL       org.opencontainers.image.description="Panasaurus container image for Java 8 HotSpot (Temurin, pinned)"
LABEL       org.opencontainers.image.url="https://github.com/panasaurus/images"
LABEL       org.opencontainers.image.source="https://github.com/panasaurus/images"
LABEL       org.opencontainers.image.vendor="Panasaurus"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt-get update \
            && apt-get install -y --no-install-recommends \
                ca-certificates \
                curl \
                fontconfig \
                git \
                iproute2 \
                libfreetype6 \
                libstdc++6 \
                lsof \
                openssl \
                sqlite3 \
                tar \
                tzdata \
            && rm -rf /var/lib/apt/lists/* \
            && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        --chmod=755 --chown=root:root ../entrypoint.sh /entrypoint.sh
ENTRYPOINT  [ "/bin/bash", "/entrypoint.sh" ]
