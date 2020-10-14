#!/bin/bash
docker run --name 'mysql' -d \
    -e MYSQL_ROOT_PASSWORD=secret \
    -e MYSQL_DATABASE=lportal \
    -e MYSQL_USER=liferay \
    -e MYSQL_PASSWORD=secret \
    mysql:5.6.30 \
    --character-set-server=utf8 \
    --collation-server=utf8_general_ci
