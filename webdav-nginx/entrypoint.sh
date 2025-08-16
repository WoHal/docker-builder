#!/bin/sh

username=$1
password=$(cryptpw -m md5 $2)

mkdir -p /app/conf
mkdir -p /app/data
chown -R nginx /app/data

echo $username:$password > /app/conf/auth.passwd

nginx -g "daemon off;"