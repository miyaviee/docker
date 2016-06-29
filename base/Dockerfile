FROM ubuntu

RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list

RUN apt-get update \
&& apt-get -y upgrade \
&& apt-get clean

RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get -y install \
git \
ruby \
curl \
unzip \
tar \
vim \
vim-nox \
openssh-server \
ruby-dev \
php \
php-dom \
php-mbstring \
locales \
silversearcher-ag \
nodejs \
npm \
&& apt-get clean

RUN sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen && locale-gen

RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

RUN curl -LO https://getcomposer.org/composer.phar \
&& chmod +x composer.phar \
&& mv composer.phar /usr/local/bin/composer

RUN gem update --system --no-document
RUN gem install bundler --no-document

RUN service ssh start

CMD ["/usr/sbin/sshd", "-D"]
