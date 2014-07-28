#!/bin/bash
source $(dirname $0)/../../config/wrench.conf
$(dirname $0)/../lcd/print_message.py "Running Command:" "VPN STATUS"
wget -q --tries=5 --timeout=20 -O - http://google.com > /dev/null
if [[ $? -eq 0 ]]; then
        country=$(whois $(wget -qO- icanhazip.com) | awk 'tolower($1) ~ /^country:/ { $
        $(dirname $0)/../lcd/print_message.py "Status: Online" "Country: $count$

else
        $(dirname $0)/../lcd/print_message.py "Status: Offline" "No Internet"
fi
