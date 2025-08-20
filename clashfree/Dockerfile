FROM node:current-alpine3.22 AS web-builder
WORKDIR /app
ARG TAG=1.19.12
RUN npm i -g pnpm && \
    apk update && apk add git && \
    git clone https://github.com/haishanh/yacd.git && \
    cd yacd && \
    pnpm i && pnpm build && \
    wget -q https://github.com/MetaCubeX/mihomo/releases/download/${TAG}/mihomo-linux-amd64-${TAG}.gz && \
    gzip -d mihomo-linux-amd64-${TAG}.gz && \
    mv mihomo-linux-amd64-${TAG} clash

FROM alpine:3.22
WORKDIR /app
COPY --from=web-builder /app/yacd/public ui
COPY --from=web-builder /app/clash /bin/clash
COPY startup.sh /bin
RUN apk update && apk add cron && \
    makedir -p /app/config

EXPOSE 7899

VOLUME [ "/app" ]

ENTRYPOINT [ "/bin/startup.sh" ]
CMD ["cron"]