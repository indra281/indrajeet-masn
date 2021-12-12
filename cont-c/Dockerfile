FROM    centos:7
RUN yum update -y && yum install httpd httpd-tools -y
RUN echo "ServerName localhost" >>  /etc/httpd/conf/httpd.conf
COPY index.html /var/www/html/
EXPOSE  80

CMD     ["/usr/sbin/httpd","-D","FOREGROUND"]
