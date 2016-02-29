FROM centos:6

RUN yum -y update \
&& yum -y install epel-release \
&& yum clean all

RUN yum -y install \
java-1.8.0-openjdk \
tar \
&& yum clean all

RUN curl -SLO http://ftp.yz.yamagata-u.ac.jp/pub/eclipse//jetty/stable-9/dist/jetty-distribution-9.3.7.v20160115.tar.gz \
&& tar xvzf jetty-distribution-9.3.7.v20160115.tar.gz \
&& mv jetty-distribution-9.3.7.v20160115 /opt/jetty \
&& rm -f jetty-distribution-9.3.7.v20160115.tar.gz

RUN curl -SLO https://github.com/gitbucket/gitbucket/releases/download/3.12/gitbucket.war \
&& mv gitbucket.war /opt/jetty/webapps

EXPOSE 8080
WORKDIR /opt/jetty
CMD java -jar start.jar

