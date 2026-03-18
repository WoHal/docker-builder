#!/bin/bash

res=$(wget -O- -q $HEALTH_API)

if [ "$res" != "$HEALTH_RESPONSE" ] && [ "" != "$TUNNEL_PIDFILE" ]; then
	kill -9 $(cat $TUNNEL_PIDFILE)
fi
