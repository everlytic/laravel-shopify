FROM php:7.4-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev \
    && pecl install mcrypt-1.0.3 \
    && docker-php-ext-enable mcrypt

RUN apt-get update && apt-get install -y \
        zlib1g-dev \
        libzip-dev \
        unzip
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www
COPY . /var/www

EXPOSE 3000
