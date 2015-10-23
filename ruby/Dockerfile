FROM debian

RUN echo 'deb http://ftp.jp.debian.org/debian/ jessie main contrib non-free' > /etc/apt/sources.list

RUN apt-get update \
&& apt-get -y upgrade \
&& apt-get -y install ruby ruby-dev \
gcc make patch zlib1g-dev \
locales task-japanese \
&& apt-get clean

RUN gem update --system

RUN echo "install: --no-document\nupdate: --no-document" > /etc/gemrc

RUN sed -i 's/^# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
RUN locale-gen
RUN update-locale LANG=en_US.UTF-8 LANGUAGE="en_US:en"

ENV LC_ALL "en_US.UTF-8"

RUN gem install nokogiri parallel

CMD ["/bin/bash"]
