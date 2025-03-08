#!/bin/sh

if [ ! -f /var/www/wordpress/wp-config.php ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
	./wp-cli.phar core download --allow-root --path=/var/www/wordpress
    ./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb --allow-root --path=/var/www/wordpress
    ./wp-cli.phar core install --url=smuravye.42.fr --title=smuravye\'s_wp --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root --path=/var/www/wordpress
    ./wp-cli.phar user create "$WP_USER" "$WP_USER_EMAIL" --user_pass=$WP_USER_PASSWORD --role=author --allow-root --path=/var/www/wordpress
fi

exec php-fpm82 -F