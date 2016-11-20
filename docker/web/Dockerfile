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
   
COPY signup /var/www/html/signup
COPY phpinfo.php /var/www/html/
COPY php.ini /etc/php5/apache2/

EXPOSE 80

CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["apachectl"]