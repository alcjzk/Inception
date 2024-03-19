FROM alpine:3.19

COPY conf/fpm.ini .
COPY conf/www.conf.ini .
COPY conf/php.ini .
COPY tools/install.sh /tmp/
COPY tools/entrypoint.sh /tmp/

RUN sh /tmp/install.sh

WORKDIR /srv

RUN wp core download

ENTRYPOINT [ "sh", "/tmp/entrypoint.sh" ]
