FROM centos:6

RUN yum -y update \
&& yum -y install epel-release \
&& yum clean all

RUN yum -y install \
java-1.8.0-openjdk \
&& yum clean all

WORKDIR /opt
RUN curl -SLO https://github.com/gitbucket/gitbucket/releases/download/3.12/gitbucket.war

EXPOSE 8080
CMD java -jar gitbucket.war --prefix=/gitbucket

