#!/bin/sh

# https://nginx.org/en/linux_packages.html#Alpine

apk update && apk upgrade
apk add openssl curl ca-certificates
printf "%s%s%s%s\n" \
"@nginx " \
"http://nginx.org/packages/alpine/v" \
`egrep -o '^[0-9]+\.[0-9]+' /etc/alpine-release` \
"/main" \
| tee -a /etc/apk/repositories
curl -o nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub
openssl rsa -pubin -in nginx_signing.rsa.pub -text -noout > modulus.out.txt
diff modulus.txt modulus.out.txt
mv nginx_signing.rsa.pub /etc/apk/keys/
apk add nginx@nginx

