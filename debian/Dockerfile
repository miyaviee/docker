FROM debian

RUN echo 'deb http://ftp.jp.debian.org/debian/ jessie main contrib non-free' > /etc/apt/sources.list

RUN apt-get update \
&& apt-get -y upgrade \
&& apt-get -y install git ssh vim \
locales task-japanese \
&& apt-get clean

RUN service ssh start
RUN service ssh stop

RUN echo "install: --no-document\nupdate: --no-document" > /etc/gemrc

RUN sed -i 's/^# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
RUN locale-gen
RUN update-locale LANG=en_US.UTF-8 LANGUAGE="en_US:en"

ENV LC_ALL "en_US.UTF-8"

RUN mkdir -m 700 /root/.ssh

VOLUME /share /home

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
