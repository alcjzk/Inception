FROM alpine:3.19

COPY fpm.ini .
COPY www.conf.ini .
COPY php.ini .
COPY install.sh /tmp/
COPY entrypoint.sh /tmp/

RUN sh /tmp/install.sh

WORKDIR /srv

RUN wp core download

ENTRYPOINT [ "sh", "/tmp/entrypoint.sh" ]
