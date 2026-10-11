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

LABEL org.opencontainers.image.title="panasaurus/images:conan_exiles"
LABEL org.opencontainers.image.description="Panasaurus image for Conan Exiles dedicated servers"
LABEL org.opencontainers.image.url="https://github.com/panasaurus/images"
LABEL org.opencontainers.image.source="https://github.com/panasaurus/images"
LABEL org.opencontainers.image.vendor="Panasaurus"
LABEL org.opencontainers.image.licenses=MIT

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        g++ \
        gcc \
        gdb \
        iproute2 \
        lib32gcc-s1 \
        lib32stdc++6 \
        lib32tinfo6 \
        lib32z1 \
        libcurl3-gnutls:i386 \
        libcurl4 \
        libcurl4-gnutls-dev:i386 \
        libfontconfig1 \
        libgcc-11-dev \
        libgcc-12-dev \
        libncurses5:i386 \
        libsdl1.2debian \
        libsdl2-2.0-0 \
        libsdl2-2.0-0:i386 \
        libtinfo6:i386 \
        netcat-traditional \
        net-tools \
        numactl \
        tar \
        telnet \
        tini \
        tzdata \
        xvfb \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install the AMD64 RCON binary.
RUN curl -fsSL \
        https://github.com/gorcon/rcon-cli/releases/download/v0.10.3/rcon-0.10.3-amd64_linux.tar.gz \
        -o /tmp/rcon.tar.gz \
    && tar xzf /tmp/rcon.tar.gz -C /tmp \
    && install -m 755 /tmp/rcon-0.10.3-amd64_linux/rcon /usr/local/bin/rcon \
    && rm -rf /tmp/rcon.tar.gz /tmp/rcon-0.10.3-amd64_linux

ENV USER=container HOME=/home/container

WORKDIR /home/container

STOPSIGNAL SIGINT

COPY --chmod=755 --chown=root:root ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/usr/bin/tini", "-g", "--"]
CMD ["/entrypoint.sh"]
