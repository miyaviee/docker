FROM centos:6

RUN yum -y update \
&& yum -y install epel-release \
&& yum clean all

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

COPY ./instantclient_11_2 /usr/local/lib/instantclient_11_2
WORKDIR /usr/local/lib/instantclient_11_2
RUN ln -s libclntsh.so.11.1 libclntsh.so

ENV ORACLE_HOME="/usr/local/lib/instantclient_11_2"
ENV NLS_LANG="Japanese_Japan.AL32UTF8"
ENV LD_LIBRARY_PATH="$ORACLE_HOME:$LD_LIBRARY_PATH"
ENV PATH="$ORACLE_HOME:$PATH"

ENV PHP_VERSION 5.3.20

ENV CONFIG "\
--enable-zend-multibyte \
--enable-mbstring \
--enable-mbregex \
--with-mysqli=shared,mysqlnd \
--with-mysql=shared,mysqlnd \
--with-pdo-mysql=shared,mysqlnd \
--with-oci8=shared,instantclient,/usr/local/lib/instantclient_11_2,11.2 \
--with-pdo-oci=shared,instantclient,/usr/local/lib/instantclient_11_2,11.2 \
--with-zlib \
--with-zlib-dir \
--with-jpeg-dir \
--with-png-dir \
--with-freetype-dir \
--with-apxs2=/usr/sbin/apxs \
--with-curl \
--with-openssl \
--with-libdir=lib64"

RUN curl -SLO "http://museum.php.net/php5/php-$PHP_VERSION.tar.gz" \
&& tar zxf php-$PHP_VERSION.tar.gz \
&& cd "php-$PHP_VERSION" && ./configure $CONFIG && make && make install \
&& cd ../ && rm -rf php-5.3.20

WORKDIR /root
RUN echo "\r\n" | pecl install YAML && rm -rf /tmp/pear
RUN echo "\r\n" | pecl install imagick && rm -rf /tmp/pear

COPY ./httpd.conf /etc/httpd/conf/httpd.conf
COPY ./ssl.conf /etc/httpd/conf.d/ssl.conf
COPY ./php.ini /etc/php.ini

EXPOSE 80 443

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
