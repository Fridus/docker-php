# PHP apache

## Extensions

- gd
- pdo
- pdo_mysql

## Mods

- rewrite

## Changing `DocumentRoot`

Use env `APACHE_DOCUMENT_ROOT`
```sh
docker run ... -e APACHE_DOCUMENT_ROOT="/var/www/html/www" ...
```

## Customization of mail configurations

Use these environment variables
- `SMTP_HOSTNAME`: Default `hostname=localhost.localdomain`
- `SMTP_ROOT`: Default `noreply@localhost.localdomain`
- `SMTP_MAILHUB`: Default `smtp`
- `SMTP_REVALIASES`: Default `www-data:mailer`

Usage with mailcatcher:
```sh
docker run ... --link mailcatcher:smtp ...
```
