#!/bin/sh

cat << EOF > /etc/nginx/inception_extra.conf
server_name ${DOMAIN};
EOF
