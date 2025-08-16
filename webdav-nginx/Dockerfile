FROM nginx:stable-alpine

ENV username
ENV password

WORKDIR /data

RUN apk update && apk add openssl nginx-mod-http-dav-ext nginx-mod-http-headers-more nginx-mod-http-fancyindex

COPY entrypoint.sh /bin
COPY webdav.conf snippets  /etc/nginx/conf.d/

EXPOSE 8080

ENTRYPOINT ["entrypoint.sh"]