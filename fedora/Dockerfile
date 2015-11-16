FROM fedora

RUN dnf -y update \
&& dnf -y install \
openssh-server \
openssh-clients \
ruby \
ruby-devel \
zlib-devel \
gcc \
make \
patch \
redhat-rpm-config \
tar \
git \
vim \
&& dnf clean all

RUN gem update --system

EXPOSE 22
CMD /sbin/init
