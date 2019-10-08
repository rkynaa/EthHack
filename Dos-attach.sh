#!/bin/sh
r=$1
if  (( "$r" -lt "1")); 
then
	 r=10000;
fi
tail -$r access_log | cut -f4 -d'"'  \
 | egrep -v 'http[s]?:\/\/isc[12]?\.sans\.org' \
 | grep -v 'http:\/\/www.nurulfikri.com\/' | sort | uniq -c | sort -n
