#! /bin/sh

u=$username
p=$(openssl passwd $password)

echo $u:$p > /etc/nginx/auth.passwd
