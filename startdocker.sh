#!/bin/bash
docker run --name 'liferay' -d \
    -p 8080:8080 \
    -e DB_KIND=mysql \
    -e DB_HOST=liferaydb \
    -e DB_USERNAME=liferay \
    -e DB_PASSWORD=secret \
    --link mysql:liferaydb \
    m4niak/liferaywithmysql
