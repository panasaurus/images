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

FROM        --platform=$TARGETOS/$TARGETARCH python:3.10-alpine

LABEL       org.opencontainers.image.title="pelecanus-dev/images:python_3.10"
LABEL       org.opencontainers.image.description="Pelecanus container image for Python 3.10"
LABEL       org.opencontainers.image.url="https://github.com/pelecanus-dev/images"
LABEL       org.opencontainers.image.source="https://github.com/pelecanus-dev/images"
LABEL       org.opencontainers.image.vendor="Pelecanus"
LABEL       org.opencontainers.image.licenses=MIT

#hadolint ignore=DL3018
RUN         apk add --no-cache cmake make ca-certificates curl ffmpeg g++ gcc git openssl sqlite tar tzdata \
            && adduser -D -h /home/container container
# This image tracks a version that has reached end-of-life.
# The shared entrypoint prints a migration warning on boot.
ENV         YOLK_EOL_NAG_WARNING=1

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        --chmod=755 --chown=root:root ../entrypoint.sh /entrypoint.sh
ENTRYPOINT  [ "/entrypoint.sh" ]
