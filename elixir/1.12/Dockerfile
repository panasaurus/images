FROM --platform=$TARGETOS/$TARGETARCH elixir:1.12.3-slim

LABEL author="MrAvox" maintainer="mravox@proton.me"

RUN         sed -i '/debian-security/d' /etc/apt/sources.list /etc/apt/sources.list.d/* 2>/dev/null || true \
            && apt-get update \
            && apt-get install -y --no-install-recommends git dnsutils curl iproute2 ffmpeg tini \
            && rm -rf /var/lib/apt/lists/* \
            && useradd -m -d /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
