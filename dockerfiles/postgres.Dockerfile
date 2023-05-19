FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories &&\
    apk update \
    && apk add postgresql postgresql-client\
    && rm -rf /var/cache/apk/* \
    && apk add php8-pgsql php8-pdo_pgsql

RUN mkdir /app && chown -R postgres:postgres /app && su postgres -c 'initdb -D /app' && chmod -R 750 /app

RUN apk update && apk add vim
RUN echo "host  all      all     0.0.0.0/0    trust" >> /app/pg_hba.conf
RUN echo "listen_addresses = '*'" >> /app/postgresql.conf

ENV POSTGRES_USER user
ENV POSTGRES_PASSWORD password
ENV POSTGRES_DB database

RUN mkdir /run/postgresql && chown postgres:postgres /run/postgresql\
    && mkdir /var/pgsql_socket/ \
    && ln -s /private/tmp/.s.PGSQL.5433 /var/pgsql_socket/

COPY init.sql /init.sql

CMD su - postgres -c "postgres -D /app && psql -f /init.sql"
