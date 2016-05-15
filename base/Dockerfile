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

RUN sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen \
&& locale-gen

RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN mkdir -m 700 /root/.ssh

EXPOSE 22
CMD ["/sbin/init"]
