FROM php:5.6-apache-stretch

ADD start.sh /start.sh

# Dep
RUN apt-get update -qq && \
    apt-get install -qq -y libpng-dev

RUN docker-php-ext-install gd pdo pdo_mysql > /dev/null

# Mod
RUN a2enmod rewrite

CMD ["/start.sh"]
