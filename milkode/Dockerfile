FROM docker.io/fedora

RUN dnf -y update \
&& dnf -y install \
ruby \
ruby-devel \
zlib-devel \
gcc \
make \
patch \
redhat-rpm-config \
tar \
gcc-c++ \
&& dnf clean all

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN gem update --system

RUN gem install milkode --no-document

RUN milk init --default

CMD milk web -n --host=0.0.0.0 --port=9292 --db=~/.milkode

