FROM php:8.1.8-fpm-alpine3.15

COPY . /user/myphp

WORKDIR /var/www

EXPOSE 9000
