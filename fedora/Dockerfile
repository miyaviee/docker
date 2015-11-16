FROM docker.io/fedora

RUN dnf -y update \
&& dnf -y install \
openssh-clients \
openssh-server \
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
the_silver_searcher \
&& dnf clean all

RUN gem update --system

RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -t rsa -b 2048 -N ''

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
