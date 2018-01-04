#!/bin/bash

MESSAGE=$(test -p /dev/stdin && cat - || printf %q "$1")

ENV_FILE=$(cd $(dirname $0);pwd)'/.env'
source $ENV_FILE

API_TOKEN=$(curl -q -s -X POST \
  https://api.line.me/v2/oauth/accessToken \
  -H "Content-Type: application/x-www-form-urlencoded" \
  --data-urlencode "grant_type=client_credentials" \
  --data-urlencode "client_id=$CHANNEL_ID" \
  --data-urlencode "client_secret=$CHANNEL_SECRET" | jq ".access_token")

curl -q -s -X POST \
  https://api.line.me/v2/bot/message/multicast \
  -H "Content-Type: application/json; charset=UTF-8" \
  -H "Authorization: Bearer $API_TOKEN" \
  -d "{\"to\": [\"$USER_ID\"], \"messages\": [{\"type\": \"text\", \"text\": \"$MESSAGE\"}] }"
