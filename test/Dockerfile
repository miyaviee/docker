FROM centos:6

RUN yum -y update && yum clean all
RUN yum -y install \
epel-release \
upstart \
&& yum clean all

CMD ["/sbin/init"]
