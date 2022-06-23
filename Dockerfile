#vi Dockerfile
FROM quay.io/centos7/httpd-24-centos7:latest
MAINTAINER NewstarCorporation
COPY index.html /var/www/html/

