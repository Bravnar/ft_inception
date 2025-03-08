FROM	alpine:3.20.6

RUN apk add --no-cache \
	php \
	php-fpm \
	php-phar \
	php-cli \
	php-mysqli \
	php-mbstring \
	curl 

RUN adduser -D -G www-data www-data

WORKDIR /var/www/wordpress

# COPY	./conf/www.conf /etc/php82/php-fpm.d/.
COPY	./tools/start.sh /usr/local/bin/start.sh
RUN		chmod +x /usr/local/bin/start.sh

EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/start.sh" ] 