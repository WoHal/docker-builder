FROM debian:stable

ARG ver=2025.7.0

RUN apt update && apt install wget cron -y && \
	wget -q -O /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/download/${ver}/cloudflared-linux-amd64 && \
	chmod +x /usr/local/bin/cloudflared

COPY cloudflared-cron /etc/cron.d/cloudflared-cron
RUN chmod 0644 /etc/cron.d/cloudflared-cron && crontab /etc/cron.d/cloudflared-cron

COPY healthcheck.sh /healthcheck.sh

USER 65532:65532

ENTRYPOINT ["cloudflared", "--no-autoupdate"]

CMD ["cron"]
