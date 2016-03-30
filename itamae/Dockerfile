FROM ruby

RUN apt-get update && apt-get -y install sudo && apt-get clean

RUN groupadd -g 1001 vagrant && useradd -s /bin/bash -m -g 1001 -u 1001 vagrant

RUN echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/vagrant
RUN sudo -u vagrant sudo gem install itamae

WORKDIR /itamae
CMD ["itamae", "local", "test.rb"]
