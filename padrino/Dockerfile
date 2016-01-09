FROM fedora

RUN dnf -y install \
ruby \
ruby-devel \
gcc \
make \
sqlite-devel \
redhat-rpm-config \
&& dnf clean all

RUN gem update --system
RUN gem install padrino --no-document

EXPOSE 3000

WORKDIR /padrino
CMD ["/sbin/init"]
