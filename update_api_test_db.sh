#!/bin/bash
# Copies the production database to the dev database

DB_DATA=`mktemp`
#PGPASSWORD=`python -c "from server import local_settings; print local_settings.DATABASES['default']['PASSWORD'],"`
echo Enter your postgres password
pg_dump -Ox -W -F t api_server_prod > $DB_DATA
echo Enter the dev database password
pg_restore -U api_server_dev -W --no-owner --dbname=api_server_dev --verbose $DB_DATA
rm $DB_DATA
#unset PGPASSWORD
