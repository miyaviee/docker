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
RUN gem install itamae bundler

COPY ./.git-completion.bash /root/.git-completion.bash
RUN echo "source '.git-completion.bash'" >> /root/.bash_profile

RUN mkdir -m 700 /root/.ssh

EXPOSE 22

CMD /sbin/init
