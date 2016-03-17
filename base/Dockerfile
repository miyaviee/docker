FROM fedora

RUN dnf -y install \
gcc \
make \
vim \
the_silver_searcher \
findutils \
git \
openssh-server \
openssh-clients \
&& dnf clean all

RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -t rsa -b 2048 -N ''
RUN mkdir -m 700 /root/.ssh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
