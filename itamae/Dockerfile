FROM ruby

RUN apt-get update \
&& apt-get -y install sudo \
&& apt-get clean

RUN groupadd -g 1001 vagrant \
&& useradd -g 1001 -u 1001 vagrant

RUN echo "vagrant	ALL=(ALL)	NOPASSWD: ALL" > /etc/sudoers.d/vagrant
ENV GEM_HOME /usr/local
RUN gem install itamae

WORKDIR /itamae
CMD ["itamae", "local", "test.rb"]
