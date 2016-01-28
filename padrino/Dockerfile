FROM fedora

RUN dnf -y install \
ruby \
ruby-devel \
gcc \
make \
postgresql-devel \
redhat-rpm-config \
&& dnf clean all

RUN gem update --system
RUN gem install padrino --no-document

ENV DATABASE_URL "db://postgres@postgres/postgres"

EXPOSE 3000

WORKDIR /app
CMD ["/sbin/init"]
