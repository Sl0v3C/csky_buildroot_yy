#!/bin/bash
#SSID=\"$1\"
#PASSWD=\"$2\"
#wpa_passphrase $SSID $PASSWD

sudo modprobe mt7601u
sudo ip link set wlan0 up
sudo wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf &
sudo dhcpcd wlan0
sudo ntpdate -u ntp.api.bz
sudo ntpdate -u ntp.api.bz

git config --global http.sslVerify false
