FROM	debian:buster

RUN	apt-get update -y && apt-get install mariadb-server -y

COPY	./tools/script.sh /

CMD	["/script.sh"]

