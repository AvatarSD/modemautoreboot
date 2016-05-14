#!/bin/bash

host=192.168.8.123
user=admin
pass=admin
cmd1='reboot'


(
echo open ${host}
sleep 1
echo ${user}
sleep 1
echo ${pass}
sleep 1
echo ${cmd1}
sleep 2

) | telnet

exit 0
