FROM php:5.6-apache-stretch

# Dep
RUN apt-get update -qq && \
    apt-get install -qq -y libpng-dev ssmtp

RUN docker-php-ext-install gd pdo pdo_mysql > /dev/null

# Mod
RUN a2enmod rewrite

# Set up php sendmail config
RUN echo "hostname=localhost.localdomain" > /etc/ssmtp/ssmtp.conf
RUN echo "root=noreply@localhost.localdomain" >> /etc/ssmtp/ssmtp.conf
RUN echo "mailhub=smtp" >> /etc/ssmtp/ssmtp.conf
RUN echo "www-data:mailer" >> /etc/ssmtp/revaliases
RUN echo "sendmail_path=sendmail -i -t" >> /usr/local/etc/php/conf.d/php-sendmail.ini

ADD start.sh /start.sh

CMD ["/start.sh"]
