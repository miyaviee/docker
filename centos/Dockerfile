FROM centos:6

RUN yum -y install openssh-clients openssh-server && yum clean all

RUN service sshd start
RUN service sshd stop

RUN sed -ri 's/^#PubkeyAuthentication(.*)/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/^#PermitRootLogin(.*)/PermitRootLogin yes/g' /etc/ssh/sshd_config

RUN mkdir -m 700 /root/.ssh

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
