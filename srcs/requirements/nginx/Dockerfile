
FROM alpine:3.20.3

RUN apk add --no-cache \
	nginx \
	openssl \
	bash \
	curl \
	wget \
	vim \
	net-tools \
	iputils \
	&& mkdir -p /run/nginx /etc/nginx/ssl \
	&& rm -rf /var/cache/apk/*

RUN openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 \
	-keyout /etc/nginx/ssl/smuravye.42.fr.key \
	-out /etc/nginx/ssl/smuravye.42.fr.crt \
	-subj "/C=CH/ST=VD/L=Gland/O=42/OU=IT/CN=smuravye.42.fr"

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE	443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
