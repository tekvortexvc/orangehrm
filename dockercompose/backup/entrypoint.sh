#!/bin/bash

mount --verbose -t cifs //192.168.88.121/orangehrm /mnt/orangehrm/ -o username=orangehrm,password=Test123@@
mysqldump -h orangehrm-mariadb --user='root' --password='password' orangehrm > /mnt/orangehrm/bkp10.sql