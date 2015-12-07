#!/bin/sh

yum -y install \
  gettext-devel \
  zlib-devel \
  openssl-devel \
  curl-devel \
  zlib-devel \
  perl-ExtUtils-MakeMaker \
  unzip \
  tar

yum clean all

if [ ! -e /tmp/git-2.6.3 ]; then
  cd /tmp \
  && curl -SLO https://github.com/git/git/archive/v2.6.3.zip \
  && unzip v2.6.3.zip \
  && rm -f v2.6.3.zip
fi

cd /tmp/git-2.6.3 \
&& make configure \
&& ./configure --prefix=/usr \
&& make \
&& make install

