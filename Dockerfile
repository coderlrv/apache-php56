FROM alpine:3.8

WORKDIR /app

# Setup apache and php
RUN apk --update add bash apache2 php5-apache2 curl \
    php5 \
    php5-json \
    php5-phar \
    php5-openssl \
    php5-mysql \
    php5-mysqli \
    php5-curl \
    php5-mcrypt \
    php5-pdo_mysql \
    php5-ctype \
    php5-gd \
    php5-xml \
    php5-dom \
    php5-gettext \
    # php5-iconv \
    && rm -f /var/cache/apk/* \
    && curl -sS https://getcomposer.org/installer | php5 -- --install-dir=/usr/local/bin --filename=composer \
    && mkdir /run/apache2 \
    && mkdir -p /opt/utils \
    && ln -s /usr/bin/php5 /usr/bin/php && \
    apk add -U tzdata && \ 
    echo "America/La_Paz" > /etc/timezone

ENV TZ=America/La_Paz

RUN echo 'session.save_path = "/tmp"' > /etc/php5/conf.d/sessionsavepath.ini && \
   echo 'date.timezone = "America/La_Paz"' > /etc/php5/conf.d/datetimezone.ini

EXPOSE 80 443

COPY start.sh /opt/utils/
RUN chmod +x /opt/utils/start.sh

ENTRYPOINT ["/opt/utils/start.sh"]
