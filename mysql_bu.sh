#!/bin/bash
# fecha has a formated date
fecha=`date +"%d-%m-%Y"`

#email_msg
email_msg="/home/auto_backup/email_text_mysql"

#Server name
server="gbuilder.com"

#email receipients
#EMAILS="zularbine@arditesbd.com,harri@groupbuilder.fi,marko@groupbuilder.fi"
EMAILS="zularbine@arditesbd.com,zularbine@gmail.com"


mysqldump -u root -p"Bangladesh@1" alvsby > "/home/auto_backup/mysql/alvsby_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" eke > "/home/auto_backup/mysql/eke_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" ekelatvija > "/home/auto_backup/mysql/ekelatvija_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" estonia > "/home/auto_backup/mysql/estonia_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" estonia2 > "/home/auto_backup/mysql/estonia2_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" estonia2.1 > "/home/auto_backup/mysql/estonia2.1_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" gb > "/home/auto_backup/mysql/gb_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" gbnc > "/home/auto_backup/mysql/gbnc_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" lapti > "/home/auto_backup/mysql/lapti_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" lki > "/home/auto_backup/mysql/lki_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" middle_east > "/home/auto_backup/mysql/middle_east_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" na > "/home/auto_backup/mysql/na_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" ncc > "/home/auto_backup/mysql/ncc_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" nccespoo > "/home/auto_backup/mysql/nccespoo_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" nccrussia > "/home/auto_backup/mysql/nccrussia_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" nccwoima > "/home/auto_backup/mysql/nccwoima_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" phojola > "/home/auto_backup/mysql/phojala_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" poland > "/home/auto_backup/mysql/poland_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" sonell_schema > "/home/auto_backup/mysql/sonell_schema_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" srv > "/home/auto_backup/mysql/srv_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" suomi > "/home/auto_backup/mysql/suomi_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" t2h > "/home/auto_backup/mysql/t2h_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" talo > "/home/auto_backup/mysql/talo_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" yit > "/home/auto_backup/mysql/yit_$fecha.sql"
mysqldump -u root -p"Bangladesh@1" yit2 > "/home/auto_backup/mysql/yit2_$fecha.sql"


if [ $? -eq 0 ]; then
   echo "GBCore SQL database backup is taken at : $(date). \nBackup files are located in: /home/auto_backup/mysql\n\n\nHave a good day!\nroot, $server" > $email_msg
   mail -s "(gbuilder.com)- SQL database backup on $fecha is Successful! " $EMAILS < $email_msg
else
   echo "GBCore SQL database backup is FAILED at : $(date). \nPlease fix it. \n\n\nHave a good day!\nroot, $server" > $email_msg
   mail -s "(gbuilder.com)- SQL database backup on $fecha is FAILED! " $EMAILS < $email_msg
fi