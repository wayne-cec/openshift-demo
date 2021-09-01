#vi Dockerfile
FROM quay.io/centos7/php-73-centos7
COPY index.php /var/www/html/index.php
RUN chmod a+rx index.php
