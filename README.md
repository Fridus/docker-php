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
