FROM php:8.1.8-fpm-alpine3.15

# Argumentos para o user
ARG user
ARG uid

RUN apk --update --no-cache add git postgresql-dev
RUN apk add --no-cache $PHPIZE_DEPS
RUN pecl install xdebug 
RUN docker-php-ext-install pdo pdo_pgsql 
RUN docker-php-ext-enable xdebug

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Usuário para composer e artisan
RUN addgroup -g "$uid" -S "$user"
RUN adduser $user --disabled-password -G "www-data" "root" -s "/bin/bash" -u "$uid" -h /home/$user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

WORKDIR /var/www
EXPOSE 9000

USER $user