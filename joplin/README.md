# joplin-web-docker

Build joplin web docker from https://github.com/laurent22/joplin.

:warning: **DOMAIN ONLY SUPPORT HTTPS**

## docker-compose.yml
```yaml
services:
    joplin-web:
        image: wohal/joplin-web
        container_name: joplin-web
        ports:
            - 8080:8080

```
