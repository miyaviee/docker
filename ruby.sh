#!/bin/sh

yum -y update

yum -y install epel-release

yum -y install \
  tar \
  gcc \
  gcc-c++ \
  make \
  libxml2-devel \
  libxslt-devel \
  zlib-devel \
  openssl-devel \
  readline-devel \
  gdbm-devel \
  tcl-devel \
  tk-devel \
  bison

yum clean all
  
VER=2.2.3

if [ ! -e /tmp/ruby-${VER} ]; then
  cd /tmp \
  && curl -SLO https://cache.ruby-lang.org/pub/ruby/2.2/ruby-${VER}.tar.gz \
  && tar xvzf ruby-${VER}.tar.gz \
  && rm -f ruby-${VER}.tar.gz
fi

cd /tmp/ruby-${VER} \
&& ./configure --prefix=/usr --disable-install-doc \
&& make \
&& make install \
