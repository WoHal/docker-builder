FROM node:12-alpine
ENV VERSION 	    1.12.0
ENV ADMIN_ACCOUNT   "admin@example.com"
ENV DB_SERVER 	    "mongo"
ENV DB_NAME 	    "yapi"
ENV DB_PORT 	    27017

WORKDIR /app

COPY entrypoint.sh /bin
COPY config.json /app

RUN npm config set registry https://registry.npmmirror.com && \
	npm install -g yapi-cli && \
	npm cache clean --force

EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]
