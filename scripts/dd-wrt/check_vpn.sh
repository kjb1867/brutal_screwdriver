#!/bin/bash
source $(dirname $0)/../../config/wrench.conf
#$(dirname $0)/../lcd/print_message_i2c.py "Running Command:" "VPN STATUS"
wget -q --tries=3 --timeout=10 -O - http://google.com > /dev/null

if [[ $? -ne 0 ]]; then

	current_vpn=$(cat $(dirname $0)/../../config/current_vpn.txt)

	echo $(date) killing vpn >>  $(dirname $0)/../../config/log_file.txt

	$SSH -i $SSH_KEY $USER@$HOST "killall openvpn"

	if [ $current_vpn != "none" ]; then

		if ssh $USER@$HOST "[ ! -f $VPN_PATH/$current_vpn.conf ]"
		then
    			$SSH -i $SSH_KEY $USER@$HOST "sed 's/$DEFAULT_VPN/$current_vpn/' $VPN_PATH/openvpn.conf > $VPN_PATH/$current_vpn.conf"
		fi

		echo $(date) starting vpn $current_vpn >>  $(dirname $0)/../../config/log_file.txt

		$SSH -i $SSH_KEY $USER@$HOST "openvpn --config $VPN_PATH/$current_vpn.conf &"
	fi
fi
