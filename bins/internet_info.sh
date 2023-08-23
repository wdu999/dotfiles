#!/bin/bash

IP=$(ipconfig getifaddr en0)
PUB_IP=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}')
# PUB_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

# INTERNET=' '
INTERNET=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep SSID | awk '{print $2}' | sed 's/-//g'`

internet_info=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep agrCtlRSSI | awk '{print $2}' | sed 's/-//g'`
# internet_info=`airport -I | grep agrCtlRSSI | awk '{print $2}' | sed 's/-//g'`

if [[ $internet_info -lt 20 ]]; then
    echo -n '#[fg=colour116]'
elif [[ $internet_info -lt 30 ]]; then
    echo -n '#[fg=colour117]'
elif [[ $internet_info -lt 40 ]]; then
    echo -n '#[fg=colour118]'
elif [[ $internet_info -lt 50 ]]; then
    echo -n '#[fg=colour119]'
else
    echo -n '#[fg=colour120]'
fi

echo -n "$INTERNET  -[$internet_info]db #[fg=colour197]$IP | $PUB_IP"


