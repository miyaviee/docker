FROM debian

RUN apt-get -y update \
&& apt-get -y install \
ruby \
ruby-dev \
zlib1g-dev \
gcc \
make \
patch \
locales \
git \
vim \
&& apt-get clean

RUN sed -ri 's/^# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
RUN locale-gen

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN gem update --system

RUN echo 'install: --no-document' >> /etc/gemrc
RUN echo 'update: --no-document' >> /etc/gemrc

CMD ["/bin/bash"]

