#!/bin/sh

# Defining variables
DATABASE_NAME="database_name"
USER='root'
PASSWORD="your_database_password"
# SRC_PATH is used because crontab works only with fullpaths.
# In order to get the SRC PATH you must be in the /src directory and in terminal enter pwd.
# The above command will return the url that you'll need to enter below.
SRC_PATH='/home/alex/Desktop/code/challenges/mysql-dump/src'

echo "starting db backup"
db_backup="db.sql"
mysqldump -u ${USER} -p${PASSWORD} --no-tablespaces ${DATABASE_NAME}  >${SRC_PATH}/${db_backup}

# Zip the db in order to reduce size
zip ${SRC_PATH}/database.zip ${SRC_PATH}/db.sql

#  Remove the sql file
rm ${SRC_PATH}/${db_backup}

# Upload File to Google Drive API
# node app.js ${DATABASE_NAME}
/usr/bin/nodejs ${SRC_PATH}/app.js ${DATABASE_NAME}

echo "db backup complete"

# Remove database.zip
rm ${SRC_PATH}/database.zip
