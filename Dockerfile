FROM php:5.6-apache-stretch

# Dep
RUN apt-get update -qq && \
    apt-get install -qq -y libpng-dev ssmtp libfreetype6-dev libjpeg-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd pdo pdo_mysql > /dev/null

# Mod
RUN a2enmod rewrite

# Sendmail config
RUN echo "hostname=localhost.localdomain" > /etc/ssmtp/ssmtp.conf && \
    echo "root=noreply@localhost.localdomain" >> /etc/ssmtp/ssmtp.conf && \
    echo "mailhub=smtp" >> /etc/ssmtp/ssmtp.conf && \
    echo "www-data:mailer" >> /etc/ssmtp/revaliases && \
    echo "sendmail_path=sendmail -i -t" >> /usr/local/etc/php/conf.d/php-sendmail.ini

# PHP config
RUN echo "upload_max_filesize = 20M" >> /usr/local/etc/php/conf.d/php-size.ini && \
    echo "post_max_size = 20M" >> /usr/local/etc/php/conf.d/php-size.ini

ADD start.sh /start.sh

CMD ["/start.sh"]
