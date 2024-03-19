FROM alpine:3.19

COPY tools/ /tmp/tools/

WORKDIR /tmp/tools

RUN sh install.sh

RUN rm -rf /tmp/tools

COPY entrypoint.sh /
COPY mariadb-server.cnf /etc/my.cnf.d/

HEALTHCHECK CMD mariadb -e "select 1"

ENTRYPOINT [ "sh", "/entrypoint.sh" ]
