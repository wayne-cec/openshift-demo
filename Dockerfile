FROM centos/httpd
EXPOSE 80
COPY index.html /var/www/html/index.html
