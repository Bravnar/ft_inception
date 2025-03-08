FROM	alpine:3.20.3

RUN apk add --no-cache \
	bash \
	php83 \
	php83-fpm \
	php83-phar \
	php83-mysqli \
	php83-cli \
	mariadb-client \
#	gnu-libiconv \
	php83-iconv

WORKDIR /var/www/wordpress

EXPOSE 9000

ENTRYPOINT [ "php-fpm83", "--nodaemonize" ]