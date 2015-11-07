FROM fedora

RUN dnf -y update && dnf -y install openssh-server \
ruby ruby-devel zlib-devel \
gcc make patch redhat-rpm-config \
tar git vim \
&& dnf clean all

COPY ./.gemrc /root/.gemrc

RUN gem update --system
RUN gem install itamae bundler

RUN mkdir -m 700 /root/.ssh

EXPOSE 22

CMD /sbin/init
