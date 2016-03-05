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
mod_ssl \
libaio-devel \
openssl-devel \
pcre-devel \
libcurl-devel \
libmcrypt-devel \
gcc \
make \
tar \
git \
gcc-c++ \
&& yum clean all

RUN curl -SLO https://www.pdflib.com/binaries/PDFlib/705/PDFlib-Lite-7.0.5p3.tar.gz \
&& tar xvzf PDFlib-Lite-7.0.5p3.tar.gz \
&& cd PDFlib-Lite-7.0.5p3 && ./configure && make && make install

ENV PHP_VERSION 5.6.18

ENV CONFIG "\
--enable-mbstring \
--enable-mbregex \
--with-mysqli=shared,mysqlnd \
--with-mysql=shared,mysqlnd \
--with-pdo-mysql=shared,mysqlnd \
--with-zlib \
--with-zlib-dir \
--with-apxs2=/usr/sbin/apxs \
--with-curl \
--with-openssl \
--with-mcrypt \
--enable-zip \
--with-config-file-path=/etc \
--with-libdir=lib64"

RUN curl -SLO http://jp2.php.net/distributions/php-${PHP_VERSION}.tar.gz \
&& tar xvzf php-${PHP_VERSION}.tar.gz \
&& cd php-${PHP_VERSION} && ./configure ${CONFIG} && make && make install

RUN curl -sS https://getcomposer.org/installer | php \
&& mv composer.phar /usr/local/bin/composer

COPY ./httpd.conf /etc/httpd/conf/httpd.conf
COPY ./php.ini /etc/php.ini

WORKDIR /app
EXPOSE 80 443
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
