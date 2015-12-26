FROM fedora

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN dnf -y install \
ruby \
&& dnf clean all

RUN gem update --system

RUN dnf -y install \
ruby-devel \
zlib-devel \
gcc \
make \
patch \
redhat-rpm-config \
tar \
&& dnf clean all

RUN gem install nokogiri parallel tilt mail color_echo --no-document

WORKDIR /share
CMD ["/bin/bash"]
