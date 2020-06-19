#!/bin/bash

set -e

dlv debug github.com/GSabadini/go-remote-debug \
  --listen=:40000 \
  --accept-multiclient \
  --headless=true \
  --api-version=2 \
  --continue \
  --log \
  && runner -c /runner.conf

exec $@