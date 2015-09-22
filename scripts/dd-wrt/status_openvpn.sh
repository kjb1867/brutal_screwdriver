#!/bin/bash
source $(dirname $0)/../../config/wrench.conf
$(dirname $0)/../lcd/print_message_i2c.py "Running Command:" "VPN STATUS"
wget -q --tries=3 --timeout=10 -O - http://google.com > /dev/null
if [[ $? -eq 0 ]]; then
        country=$(wget -qO- http://ip-api.com/json | python -c "import json,sys;obj=json.load(sys.stdin);print obj['countryCode'];")
        $(dirname $0)/../lcd/print_message_i2c.py "Status: Online" "Country: $country"

else
        $(dirname $0)/../lcd/print_message_i2c.py "Status: Offline" "No Internet"
fi
