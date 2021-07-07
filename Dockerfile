# Dockerfile
FROM debian:stretch
ARG DEBIAN_FRONTEND=noninteractive 
ARG PHP_VERSION
ARG  php_ver=${PHP_VERSION:-""}
#安裝apt-transport-https（確保APT可以在HTTPS中執行）、lsb-release（識別系統的Linux發行版的版本）及ca-certificates（CA憑證工具）
RUN apt-get update && apt-get install wget apt-transport-https lsb-release ca-certificates -y
#加入packages.sury.org的GPG key
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
#將packages.sury.org寫入至Debian的sources list套件來源清單
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

#更新sources list清單
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install php${php_ver}-fpm -y
RUN apt-get install php${php_ver}-common php-json php${php_ver}-gd php${php_ver}-cli php${php_ver}-mbstring php${php_ver}-xml php${php_ver}-opcache php${php_ver}-mysql -y

RUN . /etc/apache2/envvars
LABEL OS="ubuntu18.04" app="php,apache" maintainer="cht.andy@gmail.com" webserver="apache"
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
