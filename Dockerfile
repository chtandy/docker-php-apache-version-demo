# Dockerfile
ARG BASE_IMAGE
FROM ${BASE_IMAGE}
ARG DEBIAN_FRONTEND=noninteractive 
ARG PHP_VERSION
ARG php_ver=${PHP_VERSION:-""}

RUN apt-get update && apt-get install software-properties-common -y
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install php${php_ver} -y
RUN apt-get install php${php_ver}-common php-json php${php_ver}-gd php${php_ver}-cli php${php_ver}-mbstring php${php_ver}-xml php${php_ver}-opcache php${php_ver}-mysql -y

RUN . /etc/apache2/envvars
LABEL OS=${BASE_IMAGE} app="php,apache" maintainer="cht.andy@gmail.com" webserver="apache"
COPY ./html/ /var/www/html/
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
