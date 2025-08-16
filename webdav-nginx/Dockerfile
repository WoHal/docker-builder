FROM alpine:3.22

WORKDIR /app

RUN apk update && apk add nginx nginx-mod-http-dav-ext nginx-mod-http-headers-more nginx-mod-http-fancyindex

COPY . /etc/nginx
COPY entrypoint.sh /bin

EXPOSE 8080

ENV username=admin
ENV password=123456

CMD entrypoint.sh $username $password