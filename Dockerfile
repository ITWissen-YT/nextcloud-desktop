FROM lscr.io/linuxserver/webtop:debian-xfce

LABEL org.opencontainers.image.source="https://github.com/ITWissen-YT/nextcloud-desktop"
LABEL org.opencontainers.image.description="Web-based desktop container with Nextcloud Desktop Client"
LABEL org.opencontainers.image.title="Nextcloud Desktop Web Container"

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
       nextcloud-desktop \
       firefox-esr \
       thunar \
       curl \
       ca-certificates \
       nano \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY root/ /
RUN chmod +x /custom-cont-init.d/*.sh 2>/dev/null || true
