FROM ubuntu:24.04

EXPOSE 1080

COPY ./scripts /scripts

ENV SS_SERVER=0.0.0.0
ENV SS_PORT=1080
ENV SS_PASSWORD=value
ENV SS_METHOD=chacha20-ietf-poly1305
ENV SS_MTU=1400
ENV SS_TIMEOUT=60

RUN apt-get update \
    && apt-get install tini curl gpg lsb-release apt-utils -y \
    && curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/cloudflare-client.list \
    && apt-get update \
    && apt-get install shadowsocks-libev cloudflare-warp -y \
    && rm -rf /var/lib/apt/lists/*

VOLUME ["/var/lib/cloudflare-warp"]
CMD ["tini", "-", "sh", "/scripts/startup.sh"]