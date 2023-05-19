FROM alpine:latest

# Enable the testing repository
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Update and install packages
RUN apk update && \
    apk upgrade && \
    apk add --no-cache tini php8 php8-fpm php8-opcache php8-mysqli php8-pdo_mysql php8-json php8-openssl php8-curl php8-ctype php8-session php8-tokenizer php8-pgsql php8-pgsql php8-pdo_pgsql libpq-dev
    
# Copier le fichier de configuration PHP
# COPY php.ini /etc/php8/conf.d/

# Create a symbolic link for the php executable
RUN ln -s /usr/bin/php8 /usr/bin/php

# Run PHP-FPM
CMD ["/usr/sbin/php-fpm81", "-R", "--nodaemonize"]