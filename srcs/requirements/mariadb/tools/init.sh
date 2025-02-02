#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm
	mysqld --user=mysql --bootstrap << END
		CREATE DATABASE IF NOT EXISTS '$DB' CHARACTER SET utf8 COLLATE utf8_general_ci;
		CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWD';
		GRANT ALL PRIVILEGES ON '$DB'.* TO '$DB_USER'@'%;
		GRANT ALL PRIVILEGES ON '$DB'.* TO 'root'@'%;
		SET PASSWORD FOR 'root'@'localhost = PASSWORD('$DB_ROOT_PASSWD') ;
		FLUSH PRIVILEGES ;
END
fi

exec mysqld --user=mysql --console
