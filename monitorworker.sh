#!/bin/bash

chk_itv_sec=1		#cycle time to repeat test connections in second
be_quite_cyc=10		#reboot after count of cycle
wait_after_cyc=60	#wait count cycle after reboot
chk_addr="8.8.8.8"

counter=0
while [[ 1 ]]; do
	ping -q -w $chk_itv_sec -c 1 $chk_addr > /dev/null
	if [ $? -eq 0 ]; then
	    	echo "Online"
		counter=0
	else
		echo "Offline"
		((counter=counter+1))
		if [[ counter -eq $be_quite_cyc ]]; then
			echo "Reboot!"
			./rebootmodem.sh
			counter=0
			echo "Reboot $(date -u)" > reboot.log
			sleep $wait_after_cyc
		fi
	fi
	sleep $chk_itv_sec
done
