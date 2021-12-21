#!/bin/sh

# Defining variables
DATABASE_NAME="your_database_name"
USER='root'
PASSWORD="your_password"

echo "starting db backup"
db_backup="db.sql"
mysqldump -u ${USER} -p${PASSWORD} --no-tablespaces ${DATABASE_NAME}  >${PWD}/${db_backup}

# Zip the db in order to reduce size
zip database.zip db.sql

#  Remove the sql file
rm ${db_backup}

# Upload File to Google Drive API
node app.js ${DATABASE_NAME}

echo "db backup complete"

# Remove database.zip
rm database.zip
