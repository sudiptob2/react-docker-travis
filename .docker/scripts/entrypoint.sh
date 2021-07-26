#!/bin/sh

set -e
config_file="/etc/nginx/conf.d/default.conf"

if [[ -z "$PORT" ]] ; then
  echo "Error: PORT not defined!"
  exit 0
fi

sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
