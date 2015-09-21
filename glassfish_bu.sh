#!/bin/bash
# fecha has a formated date
fecha=`date +"%d-%m-%Y"`


#email_msg
email_msg="/home/auto_backup/email_text_apps"

#Server name
server="gbuilder.com"

#email receipients
EMAILS="zularbine@arditesbd.com,harri@groupbuilder.fi,marko@groupbuilder.fi"
#EMAILS="zularbine@arditesbd.com,zularbine@gmail.com"

# Backup and gzip the directory
tar jcvf /home/auto_backup/apps/application-$fecha.tar.bz2 /opt/glassfish4/glassfish/domains/domain1/applications/
#tar jcvf /home/auto_backup/apps/application-$fecha.test.tar.bz2 /home/auto_backup/mysql

if [ $? -eq 0 ]; then
   echo "Application folder backup is taken at : $(date). \nBackup files are located in: /home/auto_backup/apps\n\n\nHave a good day!\nroot, $server" > $email_msg
   mail -s "(gbuilder.com)- GBCore Application folder backup on $fecha is Successful! " $EMAILS < $email_msg
else
   echo "Application folder backup is FAILED at : $(date). \nPlease fix it. \n\n\nHave a good day!\nroot, $server" > $email_msg
   mail -s "(gbuilder.com)- GBCore Application folder backup on $fecha is FAILED! " $EMAILS < $email_msg
fi

# Rotate the backups, delete older than Five days
find /home/auto_backup/apps/ -mtime +5 -exec rm {} \;
