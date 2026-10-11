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

FROM        --platform=$TARGETOS/$TARGETARCH golang:1.16-alpine

LABEL       org.opencontainers.image.title="panasaurus/images:go_1.16"
LABEL       org.opencontainers.image.description="Panasaurus container image for Go 1.16"
LABEL       org.opencontainers.image.url="https://github.com/panasaurus/images"
LABEL       org.opencontainers.image.source="https://github.com/panasaurus/images"
LABEL       org.opencontainers.image.vendor="Panasaurus"
LABEL       org.opencontainers.image.licenses=MIT

#hadolint ignore=DL3018
RUN         apk add --no-cache ca-certificates tzdata

ENV         USER=container HOME=/home/container
ENV         GOMODCACHE=/home/container/.go-modcache
ENV         YOLK_EOL_NAG_WARNING=1
WORKDIR     /home/container

COPY        --chmod=755 --chown=root:root ../entrypoint.sh /entrypoint.sh
ENTRYPOINT  [ "/entrypoint.sh" ]
