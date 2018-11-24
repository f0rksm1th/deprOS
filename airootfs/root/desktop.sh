#!/bin/bash

## Replace Python smlink for tbrowser shutdown button
rm /usr/bin/python
ln -s /usr/bin/python2 /usr/bin/python
#########################################
##
## Pulseaudio+dbus abomination taming
##
## add pulseaudio users, maybe useless
## extra file in /etc/dbus-1/system.d/pulseaudio.conf
##
#########################################

useradd -r -d /var/run/pulse pulse
groupadd -r pulse
gpasswd -a pulse pulse
gpasswd -a root pulse

## start pulseaudio deamon
pulseaudio -D

## Max volume enforced
amixer sset Master 100%

## Test for Internet
i=0
c=0
while [ $i -lt 1 ]; do
  while [ $c -lt 7 ]; do
  wget -q --spider http://google.com
    if [ $? -eq 0 ]; then
        i=1
        xinit
        exit
    else
        c=$((c + 1))
    fi
    sleep 2
  done
  echo "Timeout after 7 tries - no internet."
  echo "Starting WiFi-Menu..."
  wifi-menu
  echo "Trying again..."
  c=0
done

exit
