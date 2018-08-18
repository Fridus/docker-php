#!/usr/bin/env sh

# DocumentRoot
if [ -n "$APACHE_DOCUMENT_ROOT" ]; then
  sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/sites-available/*.conf
  sed -ri -e "s!/var/www/!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
fi

# Mail
if [ -n "$SMTP_HOSTNAME" ]; then
  sed -ri -e "s!hostname=localhost.localdomain!hostname=${SMTP_HOSTNAME}!g" /etc/ssmtp/ssmtp.conf
fi
if [ -n "$SMTP_ROOT" ]; then
  sed -ri -e "s!root=noreply@localhost.localdomain!root=${SMTP_ROOT}!g" /etc/ssmtp/ssmtp.conf
fi
if [ -n "$SMTP_MAILHUB" ]; then
  sed -ri -e "s!mailhub=smtp!mailhub=${SMTP_MAILHUB}!g" /etc/ssmtp/ssmtp.conf
fi
if [ -n "$SMTP_REVALIASES" ]; then
  echo $SMTP_REVALIASES > /etc/ssmtp/revaliases
fi

apache2-foreground
