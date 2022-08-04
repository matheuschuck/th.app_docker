FROM php:8.1.8-fpm-alpine3.15


RUN apk --update --no-cache add git postgresql-dev
RUN apk add --no-cache $PHPIZE_DEPS
RUN pecl install xdebug 
RUN docker-php-ext-install pdo pdo_pgsql 
RUN docker-php-ext-enable xdebug

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
EXPOSE 9000

