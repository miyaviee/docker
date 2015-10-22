FROM debian

RUN echo 'deb http://ftp.jp.debian.org/debian/ jessie main contrib non-free' > /etc/apt/sources.list

RUN apt-get update \
&& apt-get -y upgrade \
&& apt-get -y install ruby ruby-dev gcc make patch zlib1g-dev \
&& apt-get clean

RUN gem update --system

RUN echo "install: --no-document\nupdate: --no-document" > /etc/gemrc

RUN gem install nokogiri parallel

CMD ["/bin/bash"]
