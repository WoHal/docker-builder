#!/bin/sh

mmdb_file=/app/config/Country.mmdb
conf_file=/app/config/config.yaml

# check mmdb file
if [ ! -f $mmdb_file ]; then
    wget -O $mmdb_file -q https://git.io/GeoLite2-Country.mmdb
fi

# download clash config file
rm -f $conf_file || true
wget -O $conf_file -q https://fastly.jsdelivr.net/gh/free-nodes/clashfree@main/clash.yml

# change some conf
sed -ie 's/7890/7890/' $conf_file
sed -ie 's/127.0.0.1:9090/0.0.0.0:9090/' $conf_file
sed -ie 's/allow-lan: *false/allow-lan: true/' $conf_file
sed -ie 's/cipher: ss/cipher: aes-256-cfb/g' $conf_file

sed -i '1s/^/bind-address: "*"\n/' $conf_file
sed -i '1s/^/external-ui: "\/app\/ui"\n/' $conf_file


# delete non-needed rules, only use one rule
#sed -i -n '1,/rules:/p;/MATCH/{//!d}' $conf_file
#echo '  - MATCH,🔰 节点选择' >> $conf_file

pkill clash || true
clash -d /app/config -f $conf_file