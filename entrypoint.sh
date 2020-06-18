#!/bin/bash

dlv debug github.com/GSabadini/go-remote-debug \
  --listen=:40000 \
  --accept-multiclient \
  --headless=true \
  --api-version=2 \
  --log &&\
 reflex -c /reflex.conf
