#!/bin/bash

## Replace Python smlink for tbrowser shutdown button 
rm /usr/bin/python
ln -s /usr/bin/python /usr/bin/python2
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

i=0
c=0
while [ $i -lt 1 ] && [ $c -lt 8 ]; do
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
echo "Timeout - no internet."
exit
