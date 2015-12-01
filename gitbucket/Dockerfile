FROM debian

RUN apt-get update \
&& apt-get -y update \
&& apt-get clean

RUN apt-get -y install openjdk-7-jdk \
curl \
&& apt-get clean

WORKDIR /opt
RUN curl -SLO https://github.com/gitbucket/gitbucket/releases/download/3.8/gitbucket.war

CMD java -jar gitbucket.war
