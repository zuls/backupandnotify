#!/bin/bash
# fecha has a formated date
fecha=`date +"%d-%m-%Y"`

#email_msg
email_msg="/home/email_text_ifc"

#Server name
server="groupbuilder.fi"

#email receipients
EMAILS="zularbine@arditesbd.com,harri@groupbuilder.fi,marko@groupbuilder.fi"

tar jcvf /home/ifc_bu/ifc-$fecha.tar.bz2 /home/gbifc

if [ $? -eq 0 ]; then
   echo "ifc folder backup is taken at : $(date). \nBackup file are located in: /home/ifc_bu\n\n\nHave a good day!\nroot, $server" > $email_msg
   mail -s "gbifc folder backup on $fecha is Successful! " $EMAILS < $email_msg
else
   echo "ifc folder backup is FAILED at : $(date). \nPlease fix it. \n\n\nHave a good day!\nroot, $server" > $email_msg
   mail -s "gbifc folder backup on $fecha is FAILED! " $EMAILS < $email_msg
fi
