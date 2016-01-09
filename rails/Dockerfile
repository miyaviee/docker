FROM debian

RUN echo 'deb http://ftp.jp.debian.org/debian/ jessie main contrib non-free' > /etc/apt/sources.list

RUN apt-get update && apt-get -y upgrade \
&& apt-get -y install ruby sqlite \
ruby-dev zlib1g-dev libsqlite3-dev \
gcc make patch g++ \
git vim \
&& apt-get clean

RUN gem update --system
RUN gem install rails --no-document

CMD ["/sbin/init"]
