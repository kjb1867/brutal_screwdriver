#!/bin/bash
source $(dirname $0)/../../config/wrench.conf
$(dirname $0)/../lcd/print_message_i2c.py "Running Command:" "VPN STATUS"
wget -q --tries=5 --timeout=20 -O - http://google.com > /dev/null
if [[ $? -eq 0 ]]; then
        country=$(whois $(wget -qO- icanhazip.com) | awk 'tolower($1) ~ /^country:/ { print $2; exit; } ')
        $(dirname $0)/../lcd/print_message_i2c.py "Status: Online" "Country: $country"

else
        $(dirname $0)/../lcd/print_message_i2c.py "Status: Offline" "No Internet"
fi
