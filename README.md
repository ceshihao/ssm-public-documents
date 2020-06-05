# ssm-public-documents

Collect the latest AWS SSM documents. These were acquired as follows:

```bash
aws ssm list-documents > list-documents.json
cat list-documents.json | jq -cr '.DocumentIdentifiers[].Name' | xargs -n1 sh -c 'aws ssm get-document --name $1 | jq ".Content|fromjson" > "documents/$1.json"' sh
```
