FROM		alpine:3.20.3

RUN			apk update && apk add --no-cache mariadb mariadb-client

RUN			mkdir -p /var/lib/mysql /run/mysqld && \
			chown -R mysql:mysql /var/lib/mysql /run/mysqld

COPY		./tools/init.sh /
COPY		./conf/mariadb-server.cnf /etc/my.cnf.d
RUN			chmod +x ./init.sh 

ENTRYPOINT	["sh", "init.sh"]
