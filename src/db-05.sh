#!/bin/sh

echo "starting db backup"
day="$(date +'%A')"
db_backup="mydb_${day}.sql"
sudo mysqldump  -u root -p --no-tablespaces wordpress_aaxmedia  >/home/alex/Desktop/code/challenges/mysql-dump/mydb_Monday.sql
node app.js

echo "db backup complete"
