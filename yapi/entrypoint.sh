#! /bin/sh

cd /app

sed -i "s/admin@admin.com/"${ADMIN_ACCOUNT}"/g" config.json
sed -i "s/mongo/"${DB_SERVER}"/g" config.json
sed -i "s/yapi/"${DB_NAME}"/g" config.json
sed -i "s/27017/"${DB_PORT}"/g" config.json

if [ ! -e "init.lock" ]
then
    npm config set strict-ssl false
	yapi install -v ${VERSION}
	touch init.lock
fi

node vendors/server/app.js
