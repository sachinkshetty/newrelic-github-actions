#!/bin/sh -l

echo $1
echo $2
response=$(curl -X GET 'https://api.newrelic.com/v2/applications.json' \
                     -H 'Content-Type: application/json' \
                     -H 'X-Api-Key:'$2 \
                     -G -d 'filter[name]='$1 )
echo $response
nr_app_id=$(jq ".applications[].id" <<< "$response")
echo "::set-output name=nr_app_id::$nr_app_id"