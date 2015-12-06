#!/bin/sh

if [ "$1" == "setup" ]; then
  cd /root/itamae
  itamae local -j node.json roles/test.rb
fi

if [ "$1" = "start" ]; then
  /usr/sbin/httpd -D FOREGROUND
fi
