FROM ubuntu

RUN apt-get update \
&& apt-get -y install \
gcc \
make \
vim \
vim-gtk \
curl \
silversearcher-ag \
git \
openssh-server \
&& apt-get clean

RUN mkdir -m 700 /root/.ssh

EXPOSE 22
CMD ["/sbin/init"]
