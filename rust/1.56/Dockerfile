FROM        --platform=$TARGETOS/$TARGETARCH rust:1.56-slim

LABEL       author="Ethan Coward" maintainer="ethan.coward@icloud.com"

RUN         sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list /etc/apt/sources.list.d/* 2>/dev/null || true \
            && sed -i 's|deb.debian.org/debian-security|archive.debian.org/debian-security|g' /etc/apt/sources.list /etc/apt/sources.list.d/* 2>/dev/null || true \
            && apt-get update \
            && apt-get install -y --no-install-recommends git dnsutils curl iproute2 ffmpeg tini pkg-config \
            && rm -rf /var/lib/apt/lists/* \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container CARGO_HOME=/home/container/.cargo
WORKDIR     /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]