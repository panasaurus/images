#
# Copyright (c) 2026 Pelecanus
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

FROM        --platform=$TARGETOS/$TARGETARCH mcr.microsoft.com/dotnet/sdk:7.0-bookworm-slim

LABEL       org.opencontainers.image.title="pelecanus-dev/images:dotnet_7"
LABEL       org.opencontainers.image.description="Pelecanus container image for .NET SDK 7"
LABEL       org.opencontainers.image.url="https://github.com/pelecanus-dev/images"
LABEL       org.opencontainers.image.source="https://github.com/pelecanus-dev/images"
LABEL       org.opencontainers.image.vendor="Pelecanus"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt-get update \
            && apt-get install -y --no-install-recommends \
                ca-certificates \
                curl \
                git \
                jq \
                sqlite3 \
                tzdata \
                unzip \
                zip \
            && rm -rf /var/lib/apt/lists/* \
            && useradd -d /home/container -m container
ENV         YOLK_EOL_NAG_WARNING=1

USER        container
ENV         USER=container HOME=/home/container
ENV         DOTNET_CLI_TELEMETRY_OPTOUT=1
WORKDIR     /home/container

COPY        --chmod=755 --chown=root:root ../entrypoint.sh /entrypoint.sh
ENTRYPOINT  [ "/bin/bash", "/entrypoint.sh" ]
