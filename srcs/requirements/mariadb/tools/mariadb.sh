#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
fi

mysqld --user=mysql --datadir=/var/lib/mysql --socket=/run/mysqld/mysqld.sock &

mariadb -v -u root << END
	CREATE DATABASE IF NOT EXISTS $DB ;
	CREATE USER IF NOT EXISTS $DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWD' ;
	GRANT ALL PRIVILEGES ON $DB.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWD' ;
	GRANT ALL PRIVILIGES ON $DB.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASSWD' ;
	SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASSWD');
END

killall mysqld

# kill $(cat /var/run/mysqld/mysqld.pid)

