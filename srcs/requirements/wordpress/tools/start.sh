#!/bin/sh

echo "Waiting for MariaDB..."
until /usr/bin/mysqladmin ping -h"${DB_HOST}" --silent; do
    echo "MariaDB is still starting..."
    sleep 5
done
echo "MariaDB is up - proceeding with WordPress setup."

if [ ! -f /var/www/html/wp-config.php ]; then

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
	php -d memory_limit=512M wp-cli.phar core download \
        --allow-root \
        --path=/var/www/html

    ./wp-cli.phar config create \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_USER_PASSWD \
        --dbhost=$DB_HOST \
        --allow-root \
        --path=/var/www/html

    ./wp-cli.phar core install \
        --url=$DOMAIN_NAME \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN \
        --admin_password=$WP_ADMIN_PASS \
        --admin_email=$WP_ADMIN_EMAIL \
        --allow-root \
        --path=/var/www/html
    
    ./wp-cli.phar user create \
        "$WP_USER" "$WP_USER_EMAIL" \
        --user_pass=$WP_USER_PASSWORD \
        --role=author \
        --allow-root \
        --path=/var/www/html
fi

exec php-fpm -F