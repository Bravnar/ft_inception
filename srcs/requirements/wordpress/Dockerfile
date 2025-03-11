FROM alpine:3.20.3

RUN apk update \
&&	apk add --no-cache \
	php \
	php-fpm \
	php-phar \
	php-cli \
	php-mysqli \
	curl \
	git \
	mariadb-client

RUN adduser -D -G www-data www-data

WORKDIR /var/www

# COPY conf/wp-config.php .
COPY tools/start.sh .
RUN chmod +x start.sh

EXPOSE 9000

ENTRYPOINT [ "./start.sh" ]

