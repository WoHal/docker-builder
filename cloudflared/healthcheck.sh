#!/bin/bash

res=$(wget -O- -q 127.0.0.1:20241/ready)
st=$(echo res | grep -Po '"status":\d+' | grep -Po '\d+')

if [ "$st" != "200" ] && [ "" != "$TUNNEL_PIDFILE" ]; then
	kill -9 $(cat $TUNNEL_PIDFILE)
fi
