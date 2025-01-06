FROM		alpine:3.20.3

RUN			apk update && apk add --no-cache mariadb mariadb-client

RUN			mkdir -p /var/lib/mysql /run/mysqld && \
			chown -R mysql:mysql /var/lib/mysql /run/mysqld

# COPY		conf/50-server.cnf /etc/my.cnf.d/50-server.cnf

# COPY		./tools/mariadb.sh /
# RUN			chmod +x ./mariadb.sh

# RUN			ls -la

# EXPOSE		3306

# ENTRYPOINT	["./mariadb.sh"]	

CMD			["/bin/sh"]