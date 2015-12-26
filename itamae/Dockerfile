FROM fedora

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN dnf -y install \
ruby \
&& dnf clean all

RUN gem update --system

RUN gem install itamae --no-document

WORKDIR /itamae
CMD ["/bin/bash"]
