FROM centos:6

RUN yum -y update \
&& yum -y install httpd httpd-devel \
libyaml-devel libxml2-devel \
mysql-libs ImageMagick-devel mod_ssl \
libaio-devel pcre-devel \
gcc make epel-release \
&& yum clean all

RUN yum -y install libmcrypt-devel && yum clean all

COPY ./instantclient_11_2 /usr/local/lib/instantclient_11_2

WORKDIR /usr/local/lib/instantclient_11_2
RUN ln -s libclntsh.so.11.1 libclntsh.so

ENV ORACLE_HOME="/usr/local/lib/instantclient_11_2"
ENV NLS_LANG="Japanese_Japan.AL32UTF8"
ENV LD_LIBRARY_PATH="$ORACLE_HOME:$LD_LIBRARY_PATH"
ENV PATH="$ORACLE_HOME:$PATH"

WORKDIR /usr/local/src
ADD ./php-5.3.20.tar.gz ./
RUN yum -y install libcurl-devel && yum clean all
WORKDIR /usr/local/src/php-5.3.20
RUN ./configure \
--with-curl=/usr \
--with-zlib \
--with-mysql=shared,mysqlnd \
--with-pdo-mysql=shared,mysqlnd \
--with-mysqli=shared,mysqlnd \
--with-oci8=shared,instantclient,/usr/local/lib/instantclient_11_2,11.2 \
--with-pdo-oci=shared,instantclient,/usr/local/lib/instantclient_11_2,11.2 \
--with-mcrypt \
--with-pear \
--with-ssl \
--with-apxs2=/usr/sbin/apxs \
--with-libdir=lib64 \
&& make && make install && cd ../ && rm -rf php-5.3.20

WORKDIR /root
RUN echo "\r\n" | pecl install YAML && rm -rf /tmp/pear
RUN echo "\r\n" | pecl install imagick && rm -rf /tmp/pear

COPY ./httpd.conf /etc/httpd/conf/httpd.conf
COPY ./httpd-php53.conf /etc/httpd/conf/extra/httpd-php53.conf
COPY ./php.ini /etc/php.ini

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
