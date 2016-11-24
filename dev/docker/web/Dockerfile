FROM debian
RUN apt-get update && apt-get install -y \
    apache2 \
    php5 \
    libapache2-mod-php5 \
    php5-mysql \
    vim
RUN apt-get install -y \
    libphp-phpmailer \
    ca-certificates 
RUN apt-get install -y \
    php5-redis

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
   
COPY site /var/www/html/site
COPY phpinfo.php /var/www/html/
COPY php.ini /etc/php5/apache2/
COPY run-apache.sh /tmp/
RUN chmod +x /tmp/run-apache.sh


EXPOSE 80

ENTRYPOINT ["/tmp/run-apache.sh"]