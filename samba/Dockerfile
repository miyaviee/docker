FROM centos:6

RUN yum -y install samba && yum clean all

COPY ./smb.conf /etc/samba/smb.conf

CMD ["/usr/sbin/smbd", "-DF"]
