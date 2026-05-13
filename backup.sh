#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)

mkdir -p backups

docker exec statuspulse-postgres pg_dump -U statuspulse statuspulse > backups/statuspulse-$TIMESTAMP.sql

echo "Backup completed: backups/statuspulse-$TIMESTAMP.sql"
