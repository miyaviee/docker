FROM centos:6

RUN yum -y update \
&& yum -y install epel-release \
&& yum clean all

RUN yum -y install \
httpd \
httpd-devel \
libyaml-devel \
libxml2-devel \
postgresql-devel \
postgresql-libs \
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

ENV CONFIG "\
--enable-mbstring \
--enable-mbregex \
--with-pgsql=shared \
--with-zlib \
--with-zlib-dir \
--with-apxs2=/usr/sbin/apxs \
--with-curl \
--with-openssl \
--with-mcrypt \
--enable-zip \
--with-config-file-path=/etc \
--with-libdir=lib64"

ENV PHP_VERSION 7.0.4

RUN curl -LO http://jp2.php.net/distributions/php-${PHP_VERSION}.tar.gz \
&& tar xvzf php-${PHP_VERSION}.tar.gz \
&& cd php-${PHP_VERSION} && ./configure ${CONFIG} && make && make install

RUN curl -sS https://getcomposer.org/installer | php \
&& mv composer.phar /usr/local/bin/composer

COPY ./httpd.conf /etc/httpd/conf/httpd.conf
COPY ./php.ini /etc/php.ini

ENV DATABASE_URL db://postgres:@elbacky_postgres/postgres

WORKDIR /app
EXPOSE 80 443
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
