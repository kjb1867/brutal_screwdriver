#!/bin/bash
source $(dirname $0)/../../config/wrench.conf
$(dirname $0)/../lcd/print_message.py "Running Command:" "Killing VPN"
$SSH -i $SSH_KEY $USER@$HOST "killall openvpn"
$(dirname $0)/../lcd/print_message.py "Done Command:" "Killing VPN"
