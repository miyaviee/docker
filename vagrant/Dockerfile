FROM centos:6

RUN yum -y update \
&& yum -y install \
openssh-clients openssh-server sudo \
&& yum clean all

RUN groupadd -g 1001 vagrant
RUN useradd -u 1000 -g 1001 vagrant
RUN echo "vagrant:vagrant" | chpasswd vagrant

RUN echo "%vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

RUN su - vagrant /bin/bash -c 'mkdir -m 700 ~/.ssh'

EXPOSE 22
RUN service sshd start
CMD /sbin/init
