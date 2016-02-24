FROM fedora

RUN dnf -y update \
&& dnf -y install \
ruby \
ruby-devel \
zlib-devel \
redhat-rpm-config \
fontconfig-devel \
patch \
gcc \
make \
tar \
bzip2 \
unzip \
&& dnf clean all

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN echo 'install: --no-document' >> /etc/gemrc \
&& echo 'update: --no-document' >> /etc/gemrc

RUN gem update --system

RUN gem install capybara poltergeist

RUN curl -SLO https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
&& tar jvxf phantomjs-2.1.1-linux-x86_64.tar.bz2 \
&& cp phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin \
&& rm -rf phantomjs-2.1.1-linux-x86_64*

RUN cd /usr/share/fonts \
&& rm -rf ./* \
&& curl -SLO https://osdn.jp/projects/mix-mplus-ipa/downloads/63545/migu-1m-20150712.zip \
&& unzip migu-1m-20150712.zip && rm -rf migu-1m-20150712.zip

WORKDIR /app
CMD /bin/bash
