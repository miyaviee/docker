FROM fedora

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN dnf -y update \
&& dnf clean all

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

RUN gem install nokogiri --no-document

CMD ["/bin/bash"]
