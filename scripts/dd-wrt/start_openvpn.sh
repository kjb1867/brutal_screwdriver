#!/bin/bash
source $(dirname $0)/../../config/wrench.conf
$(dirname $0)/../lcd/print_message_i2c.py "Running Command:" "Starting VPN"
$SSH -i $SSH_KEY $USER@$HOST "openvpn --config /tmp/openvpncl/openvpn.conf &"

echo $DEFAULT_VPN > $(dirname $0)/../../config/current_vpn.txt

$(dirname $0)/../lcd/print_message_i2c.py "Done Command:" "Starting VPN"
