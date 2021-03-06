#!/bin/bash
source $(dirname $0)/../../config/wrench.conf
$(dirname $0)/../lcd/print_message_i2c.py "Running Command:" "$1"

if ssh $USER@$HOST "[ ! -f $VPN_PATH/$1.conf ]"
then
    $SSH -i $SSH_KEY $USER@$HOST "sed 's/$DEFAULT_VPN/$1/' $VPN_PATH/openvpn.conf > $VPN_PATH/$1.conf"
fi

$SSH -i $SSH_KEY $USER@$HOST "killall openvpn; openvpn --config $VPN_PATH/$1.conf &"

echo $1 > $(dirname $0)/../../config/current_vpn.txt

$(dirname $0)/../lcd/print_message_i2c.py "Done Command:" "$1"
