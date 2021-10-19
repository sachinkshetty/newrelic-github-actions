#!/bin/sh -l

app-name = $1
api-key = $2
echo $appName
response=$(curl -X GET 'https://api.newrelic.com/v2/applications.json' \
                     -H 'Content-Type: application/json' \
                     -H 'X-Api-Key:'$2 \
                     -G -d 'filter[name]='$1 )

nr_app_id=$(jq ".applications[].id" <<< "$response")
echo "::set-output name=nr_app_id::$nr_app_id"