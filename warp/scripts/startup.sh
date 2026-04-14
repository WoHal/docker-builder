#!/bin/sh

warp-cli --accept-tos registration new

warp-cli --accept-tos connect


ss-server -s $SS_SERVER \
    -p $SS_PORT \
    -k $SS_PASSWORD \
    -m $SS_METHOD \
    -mtu $SS_MTU \
    -t $SS_TIMEOUT \
    -u \
    --fast-open