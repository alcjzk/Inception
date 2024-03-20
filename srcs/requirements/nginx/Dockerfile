FROM alpine:3.19

COPY tools/ /tmp/tools/
WORKDIR /tmp/tools
RUN sh install.sh

COPY conf/inception.conf /etc/nginx/conf.d/
RUN rm -rf /etc/nginx/conf.d/default.conf

ARG DOMAIN

RUN sh configure.sh

RUN rm -rf /tmp/tools

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
