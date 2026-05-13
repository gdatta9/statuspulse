#!/bin/bash

FILE=$1

docker exec -i statuspulse-postgres psql -U statuspulse statuspulse < $FILE

echo "Restore completed from $FILE"

