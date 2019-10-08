#!/bin/bash
# Ping multiple destinations at once
args=$#
interval=$1
shift;
pktsize=$1
shift;
for (( i=3; i<=$args; i++ )); do
        ping -i $interval -s $pktsize $1 > /dev/null &
        shift;
done
#./pingmany 0.5 972 192.168.2.21 192.168.2.22 192.168.2.23 192.168.2.24
#kill -SIGINT `pgrep ping`
