FROM centos:6

RUN yum -y update \
&& yum -y install epel-release \
&& yum clean all

RUN yum -y install nginx \
&& yum clean all

RUN mkdir /etc/nginx/ssl
COPY ./ssl.sh /etc/nginx/ssl
RUN cd /etc/nginx/ssl && ./ssl.sh

COPY ./ssl.conf /etc/nginx/conf.d
COPY ./default.conf /etc/nginx/conf.d

RUN chkconfig nginx on
EXPOSE 80 443
CMD /sbin/init
