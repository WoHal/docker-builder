FROM node:current-alpine3.22 AS web-builder
ARG TAG=v1.19.12

# build ui
WORKDIR /clash-ui
RUN npm i -g pnpm && \
    wget -O yacd.zip -q https://github.com/haishanh/yacd/archive/refs/heads/master.zip && \
    unzip yacd.zip && \
    cd yacd-master && pnpm i && pnpm build

WORKDIR /clash_config
RUN wget -O Country.mmdb -q https://git.io/GeoLite2-Country.mmdb && \
    wget -O config.yaml -q https://fastly.jsdelivr.net/gh/free-nodes/clashfree@main/clash.yml

# download clash binary
WORKDIR /mihomo
RUN wget -q https://github.com/MetaCubeX/mihomo/releases/download/${TAG}/mihomo-linux-amd64-${TAG}.gz && \
    gzip -d mihomo-linux-amd64-${TAG}.gz && \
    mv mihomo-linux-amd64-${TAG} clash && chmod +x clash

FROM alpine:3.22

WORKDIR /app
COPY cron.sh /etc/periodic/weekly/cron.sh
COPY startup.sh /
COPY --from=web-builder /clash_ui/yacd-master/public ui
COPY --from=web-builder /clash_config config
COPY --from=web-builder /mihomo/clash /bin/clash

ENV SKIP_SAFE_PATH_CHECK=true

EXPOSE 7890
EXPOSE 9090

ENTRYPOINT [ "/startup.sh" ]