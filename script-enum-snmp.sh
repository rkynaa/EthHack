#!/bin/bash
# Ini adalah shell script, yang akan melakukan
# Enumerasi SNMP terhadap PC/Komputer yang menjalankan 
# service SNMP


TARGET=$1
if [ -z "$TARGET" ];
then
      echo "Gagal: Gunakan $0 <ip/network target>"
      exit 1;
fi

echo "Argument yg disuply : $TARGET"

for IP in `nmap -sU -p161 --open $TARGET | grep report | awk '{ print $5 }'`; 
do 
	snmpcheck -c public -t $IP >> /tmp/hasil-enum-snmp.txt; 
done
