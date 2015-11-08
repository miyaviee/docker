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

COPY ./.gemrc /root/.gemrc

RUN gem update --system
RUN gem install bundler

COPY ./.git-completion.bash /root/.git-completion.bash
RUN echo "source '.git-completion.bash'" >> /root/.bash_profile

RUN mkdir -m 700 /root/.ssh

ENV LC_ALL en_US.UTF-8

EXPOSE 22
CMD /sbin/init
