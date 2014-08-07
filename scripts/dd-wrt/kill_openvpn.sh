#!/bin/bash
source $(dirname $0)/../../config/wrench.conf
$(dirname $0)/../lcd/print_message_i2c.py "Running Command:" "Killing VPN"
$SSH -i $SSH_KEY $USER@$HOST "killall openvpn"
$(dirname $0)/../lcd/print_message_i2c.py "Done Command:" "Killing VPN"
