FROM alpine:3.19

COPY tools/ /tmp/tools/

RUN sh /tmp/tools/install.sh

COPY conf/mariadb-server.cnf /etc/my.cnf.d/

HEALTHCHECK CMD su docker_healthcheck -c "mariadb -e 'select 1'"

ENTRYPOINT [ "sh", "/tmp/tools/entrypoint.sh" ]
