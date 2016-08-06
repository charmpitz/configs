#!/bin/bash

mysql_export ()
{
    echo -n "User: " 
    read USER

    echo -n "Password: "
    read -s PASSWORD

    # Using 2>/dev/null to suppress Warnings
    databases=`mysql --user=$USER --password=$PASSWORD -e "SHOW DATABASES;" 2>/dev/null | egrep -v "(information|performance)_schema|Database"`

    for db in $databases; do
        if [[ "$db" != _* ]] ; then
            echo "Dumping database: $db"

            # Using 2>/dev/null to suppress Warnings
            mysqldump --user=$USER --password=$PASSWORD --databases $db 2>/dev/null > `date +%Y%m%d`.$db.sql
            
            # Gzipping after
            gzip `date +%Y%m%d`.$db.sql
        fi
    done
}
