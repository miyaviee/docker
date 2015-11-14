FROM centos:6

RUN yum -y update \
&& yum -y install epel-release \
&& yum clean all

RUN yum -y install \
unzip \
perl-ExtUtils-MakeMaker \
tcl*.x86_64 \
expat-devel \
gettext-devel \
curl-devel \
gcc \
make \
openssl-devel \
zlib-devel \
tar \
&& yum clean all

ENV SRC_DIR "/usr/local/src"
WORKDIR $SRC_DIR
RUN curl -SLO https://github.com/git/git/archive/master.zip \
&& unzip master.zip \
&& cd git-master \
&& make configure \
&& ./configure --prefix=/usr \
&& make \
&& make install \
&& rm -rf $SRC_DIR/*

RUN yum -y install \
tar \
gcc \
make \
patch \
openssl-devel \
readline-devel \
zlib-devel \
&& yum clean all

ENV RBENV_ROOT "/usr/local/rbenv"
RUN git clone https://github.com/sstephenson/rbenv.git $RBENV_ROOT
RUN git clone https://github.com/sstephenson/ruby-build.git $RBENV_ROOT/plugins/ruby-build

ENV RUBY_VER "2.2.2"

ENV CONFIGURE_OPTS "--disable-install-rdoc"

RUN $RBENV_ROOT/bin/rbenv install $RUBY_VER
RUN $RBENV_ROOT/bin/rbenv global $RUBY_VER

RUN echo 'RBENV_ROOT=/usr/local/rbenv' >> /etc/profile
RUN echo 'export "PATH=$RBENV_ROOT/shims:$PATH"' >> /etc/profile

RUN $RBENV_ROOT/shims/gem update --system

RUN yum -y install \
httpd \
httpd-devel \
libyaml-devel \
libxml2-devel \
mysql-libs \
ImageMagick-devel \
mod_ssl \
libaio-devel \
openssl-devel \
pcre-devel \
libcurl-devel \
libmcrypt-devel \
gcc \
make \
tar \
&& yum clean all

# COPY ./instantclient_11_2 /usr/local/lib/instantclient_11_2
# WORKDIR /usr/local/lib/instantclient_11_2
# RUN ln -s libclntsh.so.11.1 libclntsh.so

ENV ORACLE_HOME="/usr/local/lib/instantclient_11_2"
ENV NLS_LANG="Japanese_Japan.AL32UTF8"
ENV LD_LIBRARY_PATH="$ORACLE_HOME:$LD_LIBRARY_PATH"
ENV PATH="$ORACLE_HOME:$PATH"

ENV PHP_VERSION 5.3.20

RUN curl -SLO "http://museum.php.net/php5/php-$PHP_VERSION.tar.gz" \
&& tar zxf php-$PHP_VERSION.tar.gz \
&& cd "php-$PHP_VERSION" \
&& ./configure \
--enable-zend-multibyte \
--enable-mbstring \
--enable-mbregex \
--with-mysqli=shared,mysqlnd \
--with-mysql=shared,mysqlnd \
--with-pdo-mysql=shared,mysqlnd \
# --with-oci8=shared,instantclient,/usr/local/lib/instantclient_11_2,11.2 \
# --with-pdo-oci=shared,instantclient,/usr/local/lib/instantclient_11_2,11.2 \
--with-zlib \
--with-zlib-dir \
--with-jpeg-dir \
--with-png-dir \
--with-freetype-dir \
--with-apxs2=/usr/sbin/apxs \
--with-curl \
--with-openssl \
--with-libdir=lib64 \
&& make && make install && cd ../ && rm -rf php-5.3.20

WORKDIR /root
RUN echo "\r\n" | pecl install YAML && rm -rf /tmp/pear
RUN echo "\r\n" | pecl install imagick && rm -rf /tmp/pear

#COPY ./httpd.conf /etc/httpd/conf/httpd.conf
#COPY ./ssl.conf /etc/httpd/conf.d/ssl.conf
#COPY ./php.ini /etc/php.ini

RUN rpm -ivh http://swiftsignal.com/packages/centos/6/x86_64/the-silver-searcher-0.13.1-1.el6.x86_64.rpm

EXPOSE 80 443

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
