FROM centos:6

RUN yum -y install openssh-clients openssh-server && yum clean all

RUN service sshd start

RUN ssh-keygen -f /root/.ssh/id_rsa -t rsa -b 2048 -N ''
RUN cp /root/.ssh/id_rsa.pub ~root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

RUN sed -ri 's/^#PubkeyAuthentication(.*)/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/^#RootLoginPermit(.*)/RootLoginPermit yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD /sbin/init
