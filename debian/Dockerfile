FROM debian

RUN echo 'deb http://ftp.jp.debian.org/debian/ jessie main contrib non-free' > /etc/apt/sources.list

RUN apt-get update \
&& apt-get -y upgrade \
&& apt-get -y install ssh vim \
&& apt-get clean

RUN service ssh start
RUN service ssh stop

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
