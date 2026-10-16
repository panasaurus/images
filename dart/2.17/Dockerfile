FROM        --platform=$TARGETOS/$TARGETARCH dart:2.17

LABEL       author="Alden Bansemer" maintainer="alden@knoban.com"

RUN         apt-get update \
            && apt-get install -y --no-install-recommends iproute2 git ca-certificates tzdata tini \
            && rm -rf /var/lib/apt/lists/* \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
