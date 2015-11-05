FROM debian

RUN echo 'deb http://ftp.jp.debian.org/debian/ jessie main contrib non-free' > /etc/apt/sources.list

RUN apt-get update \
&& apt-get -y upgrade \
&& apt-get -y install git ssh vim \
locales task-japanese silversearcher-ag \
gcc make ruby patch ruby-dev zlib1g-dev \
&& apt-get clean

RUN git clone https://github.com/miyaviee/vim.git /root/vim
RUN cd /root/vim && ./setup.sh

RUN service ssh start
RUN service ssh stop

RUN echo "install: --no-document\nupdate: --no-document" > /etc/gemrc
RUN echo "alias vi=vim" >> /etc/profile

RUN gem install itamae bundler

RUN sed -i 's/^# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
RUN locale-gen
RUN update-locale LANG=en_US.UTF-8 LANGUAGE="en_US:en"

ENV LC_ALL "en_US.UTF-8"

RUN mkdir -m 700 /root/.ssh

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
