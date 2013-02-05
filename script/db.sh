#!/bin/bash

DATABASE=magmarails
TIMESTAMP=`date +"%Y%m%d-%H%M%S"`
FILENAME=$TIMESTAMP.sql

echo "Capture the database"
heroku pgbackups:capture --expire

echo "Download the backup"
wget -O $FILENAME `heroku pgbackups:url`

echo "Restore the database"
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d $DATABASE $FILENAME

echo "Done"
