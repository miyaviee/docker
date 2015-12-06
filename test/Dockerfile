FROM centos:6

RUN yum -y update && yum clean all
RUN yum -y install \
httpd \
httpd-devel \
php \
&& yum clean all

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
