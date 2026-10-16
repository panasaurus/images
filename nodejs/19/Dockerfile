FROM        --platform=$TARGETOS/$TARGETARCH node:19-bullseye-slim

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN         sed -i '/debian-security/d' /etc/apt/sources.list /etc/apt/sources.list.d/* 2>/dev/null || true \
            && apt-get update \
            && apt-get install -y --no-install-recommends ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool iputils-ping libnss3 tini \
            && rm -rf /var/lib/apt/lists/* \
            && useradd -m -d /home/container container

RUN         npm install --global npm@9.8.1 typescript ts-node @types/node

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
