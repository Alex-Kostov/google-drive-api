# Defining variables
DATABASE_NAME="wordpress_aaxmedia"
USER='root'
PASSWORD="password"

#!/bin/sh

echo "starting db backup"
# day="$(date +'%Y-%m-%d-%H%M%S')"
db_backup="db.sql"
mysqldump -u ${USER} -p${PASSWORD} --no-tablespaces ${DATABASE_NAME}  >${PWD}/../files/${db_backup}

# Zip the db in order to reduce size
cd ../files
zip database.zip db.sql
#  Remove the sql file
rm db.sql

# Upload File to Google Drive API
cd ../src
echo ${PWD}
# node app.js

echo "db backup complete"

