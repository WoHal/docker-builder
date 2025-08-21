# freeline

```yml
# docker-compose.yml
services:
  freeline:
    image: wohal/freeline
    container_name: freeline
    restart: unless-stopped
    ports:
      - 7890:7890
      - 9090:9090
```
