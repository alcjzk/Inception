FROM alpine:3.19

COPY tools/ /tmp/tools/
WORKDIR /tmp/tools
RUN sh install.sh

COPY conf/inception.conf /etc/nginx/conf.d/
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.bak

ARG DOMAIN

RUN sh configure.sh

RUN rm -rf /tmp/tools

EXPOSE 80 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
