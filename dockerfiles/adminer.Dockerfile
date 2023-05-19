FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories &&\
    apk update && \
    apk upgrade && \
    apk add --no-cache php8 \
    php8 php8-fpm \ 
    php8-opcache \
    php8-json \
    php8-openssl \
    php8-curl \
    php8-zip \
    php8-mbstring \
    php8-phar \
    php8-iconv \
    php8-ctype \
    php8-session \
    php8-tokenizer \
    php8-xml \
    php8-pgsql \
    php8-pdo_pgsql



# Create a symbolic link for the php executable
RUN ln -s /usr/bin/php8 /usr/bin/php

# install adminer dans /var/www/html/
RUN wget -q -O ./adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php/

# # Set the working directory
WORKDIR /var/www/html

# WORKDIR /srv
EXPOSE 80

# CMD php -S 0.0.0.0:8080 -t /var/www/html
CMD php -S 0.0.0.0:8080 