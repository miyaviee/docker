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
&& yum clean all

ENV PHP_VERSION 5.6.18

ENV CONFIG "\
--enable-zend-multibyte \
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
--with-libdir=lib64"

RUN curl -SLO http://jp2.php.net/distributions/php-${PHP_VERSION}.tar.gz \
&& tar xzf php-${PHP_VERSION}.tar.gz \
&& cd php-${PHP_VERSION} && ./configure $CONFIG && make && make install \
&& cd ../ && rm -rf php-${PHP_VERSION}*

RUN yum -y install gcc \
gcc-c++ \
autoconf \
automake \
kernel-devel \
ncurses-devel \
expat-devel \
gettext-devel \
zlib-devel \
curl-devel \
perl-ExtUtils-MakeMaker \
openssl-devel \
mysql-server \
unzip \
openssh-server \
vim \
&& yum clean all

RUN curl -SLO https://github.com/git/git/archive/master.zip \
&& unzip master.zip && cd git-master \
&& make configure && ./configure && make && make install \
&& cd ../ && rm -rf git-master

RUN curl -sS https://getcomposer.org/installer | php \
&& mv composer.phar /usr/local/bin/composer

RUN git clone -b 3.0-stable https://github.com/bcit-ci/CodeIgniter.git /app

COPY ./composer.json /app/composer.json
RUN cd /app && composer install

COPY ./httpd.conf /etc/httpd/conf/httpd.conf
RUN service httpd start
RUN chkconfig httpd on
RUN service sshd start
RUN chkconfig sshd on

WORKDIR /app
EXPOSE 80 443
CMD ["/sbin/init"]
