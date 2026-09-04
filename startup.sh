#!/bin/sh
set -e
if curl -sf http://127.0.0.1:8080/ >/dev/null 2>&1; then
  exit 0
fi
cd /workspace/public
python3 -m http.server 8080 --bind 0.0.0.0 >/tmp/cx-http.log 2>&1 &
sleep 0.4
curl -sf -o /dev/null http://127.0.0.1:8080/ || true
exit 0
