#!/bin/bash

set -e

aws ssm list-documents > list-documents.json
cat list-documents.json | jq -cr '.DocumentIdentifiers[].Name' | xargs -n1 sh -c 'sleep 1 && aws ssm get-document --name $1 | jq ".Content|fromjson" > "documents/$1.json"' sh
