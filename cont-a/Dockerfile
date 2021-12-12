FROM    centos:7
RUN yum update -y && yum install httpd httpd-tools -y
RUN echo "ServerName localhost" >>  /etc/httpd/conf/httpd.conf
COPY vhost/* /etc/httpd/conf.d/
EXPOSE  80

CMD     ["/usr/sbin/httpd","-D","FOREGROUND"]
