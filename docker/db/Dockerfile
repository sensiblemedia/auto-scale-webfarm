FROM debian
MAINTAINER admin@sensible.co
RUN echo "mysql-server-5.5 mysql-server/root_password password secret" | debconf-set-selections
RUN echo "mysql-server-5.5 mysql-server/root_password_again password secret" | debconf-set-selections

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq mysql-server

RUN sed -i -e "s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

COPY mysqlrun.sh /tmp/mysql_run.sh
RUN chmod +x /tmp/mysql_run.sh

EXPOSE 3306

ENTRYPOINT ["/tmp/mysql_run.sh"]