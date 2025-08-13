# cloudflared

Source from https://github.com/cloudflare/cloudflared.


```yml
# docker-compose.yml
services:
  cloudflared:
    image: wohal/cloudflared:2025.7.0
    container_name: cloudflared
    user: 0
    restart: unless-stopped
    command: "tunnel --pidfile $TUNNEL_PIDFILE --url $TUNNEL_URL run --token $TUNNEL_TOKEN"
    environment:
      - TUNNEL_PIDFILE=/run/cf.pid
      - TUNNEL_URL=https://example.com
      - TUNNEL_TOKEN=xxxxxxxxxxx
```
