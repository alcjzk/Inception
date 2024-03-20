#!/bin/sh

apk update
apk upgrade
apk add mysql mysql-client
adduser -s /bin/sh -SDH docker_healthcheck
