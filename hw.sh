#!/bin/sh

yum -y update

yum -y install \
  epel-release

yum -y update \
  && yum -y install \
  automake \
  autoconf \
  gperftools

yum clean all

cd /tmp \
  && git clone https://github.com/tkengo/highway.git

cd /tmp/highway \
  && ./tools/build.sh \
  && mv hw /usr/local/bin

rm -rf /tmp/highway

