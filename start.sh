#!/bin/bash

set -e

#dlv debug \
#  --listen=:40000 \
#  --headless=true \
#  --accept-multiclient \
#  --continue \
#  --api-version=2 \
#  --log \
fresh -c /runner.conf \
&& dlv exec \
  ./tmp/runner-build \
  --listen=:40000 \
  --headless=true \
  --accept-multiclient \
  --continue \
  --api-version=2 \
  --log \


exec $@
#reflex -c /reflex.conf
#
