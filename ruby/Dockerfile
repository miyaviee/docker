FROM fedora

RUN dnf -y update \
&& dnf -y install \
ruby \
ruby-devel \
zlib-devel \
gcc \
make \
patch \
git \
vim \
findutils \
automake \
autoconf \
gperftools \
redhat-rpm-config \
tar \
&& dnf -y clean all

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN gem update --system

RUN echo 'install: --no-document' >> /etc/gemrc
RUN echo 'update: --no-document' >> /etc/gemrc

RUN git clone https://github.com/tkengo/highway.git /usr/local/src/highway \
&& cd /usr/local/src/highway \
&& ./tools/build.sh \
&& mv hw /usr/local/bin \
&& cd ../ \
&& rm -rf /usr/local/src/highway

CMD ["/sbin/init"]
