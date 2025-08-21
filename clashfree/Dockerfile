FROM node:current-alpine3.22 AS web-builder
WORKDIR /builder
ARG TAG=v1.19.12
RUN npm i -g pnpm && \
    wget -O yacd.zip -q https://github.com/haishanh/yacd/archive/refs/heads/master.zip && \
    unzip yacd.zip && \
    cd yacd-master && pnpm i && pnpm build && \
    cd /builder && wget -q https://github.com/MetaCubeX/mihomo/releases/download/${TAG}/mihomo-linux-amd64-${TAG}.gz && \
    gzip -d mihomo-linux-amd64-${TAG}.gz && \
    mv mihomo-linux-amd64-${TAG} clash && chmod +x clash

FROM alpine:3.22
WORKDIR /app

RUN mkdir -p /app/config

COPY startup.sh /etc/periodic/weekly/startup.sh
COPY --from=web-builder /builder/yacd-master/public ui
COPY --from=web-builder /builder/clash /bin/clash

ENV SKIP_SAFE_PATH_CHECK=true

EXPOSE 7890
EXPOSE 9090

ENTRYPOINT [ "/etc/periodic/weekly/startup.sh" ]