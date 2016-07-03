FROM ubuntu

RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list

RUN apt-get update \
&& apt-get -y upgrade \
&& apt-get clean

RUN apt-get -y install \
openjdk-8-jdk \
curl \
&& apt-get clean

ENV VER 4.1

WORKDIR /opt
RUN curl -LO https://github.com/gitbucket/gitbucket/releases/download/${VER}/gitbucket.war

EXPOSE 8080
CMD ["java", "-jar", "gitbucket.war"]

