FROM node:22-alpine AS builder
ARG tag

WORKDIR /app

RUN apk update && apk add git rsync && \
        git clone --depth 1 https://github.com/laurent22/joplin.git && \
        cd joplin && git pull && git checkout ${tag} && \
        cd /app/joplin && yarn install && \
        cd packages/app-mobile && yarn web

FROM nginx:stable-alpine

COPY joplin-nginx.conf /etc/nginx/conf.d/joplin.conf

COPY --from=builder /app/joplin/packages/app-mobile/web/dist/* /var/www/html/

EXPOSE 8080