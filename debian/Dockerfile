FROM debian

RUN echo 'deb http://ftp.jp.debian.org/debian/ jessie main contrib non-free' > /etc/apt/sources.list

RUN apt-get update \
&& apt-get -y upgrade \
&& apt-get -y install ssh vim \
&& apt-get clean

RUN service ssh start
RUN service ssh stop

RUN ssh-keygen -f /root/.ssh/id_rsa -t rsa -b 2048 -N ''
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
