#!/bin/bash
DATETIME=$(date '+%Y%m%d-%H%M%S')

# mount smb share
mount --verbose -t cifs $SMB_NETWORK_PATH $SMB_MOUNT_PATH -o username=$SMB_USERNAME,password=$SMB_PASSWORD

# dump mysql database
mysqldump -h orangehrm-mariadb --user=$MARIADB_USERNAME --password=$MYSQL_ROOT_PASSWORD orangehrm > /orangehrm-bkp-$DATETIME.sql

if [ $? -eq 0 ]
    then 
        # compress my sql dump
        tar -czvf orangehrm-bkp-$DATETIME.tar.gz /orangehrm-bkp-$DATETIME.sql

        # copy tar.gz to smb server
        cp orangehrm-bkp-$DATETIME.tar.gz $SMB_MOUNT_PATH
fi