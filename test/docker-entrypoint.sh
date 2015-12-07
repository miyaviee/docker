#!/bin/sh

if [ "$1" == "setup" ]; then
  service httpd stop
fi

if [ "$1" == "start" ]; then
  /usr/sbin/httpd -D FOREGROUND
fi
