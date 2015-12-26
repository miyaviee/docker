FROM fedora

RUN dnf -y update \
&& dnf clean all

RUN dnf -y install \
ruby \
ruby-devel \
zlib-devel \
gcc \
make \
patch \
redhat-rpm-config \
tar \
&& dnf clean all

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN gem update --system

RUN echo 'install: --no-document' >> /etc/gemrc
RUN echo 'update: --no-document' >> /etc/gemrc

RUN gem install nokogiri

CMD ["/bin/bash"]
