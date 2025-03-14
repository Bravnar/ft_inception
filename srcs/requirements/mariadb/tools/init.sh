#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm
	mysqld --user=root --bootstrap << END
		CREATE DATABASE IF NOT EXISTS \`$DB_NAME\` CHARACTER SET utf8 COLLATE utf8_general_ci;
        CREATE USER IF NOT EXISTS \`$DB_USER\`@'%' IDENTIFIED BY '$DB_USER_PASSWD';
        GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO \`$DB_USER\`@'%';
        GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
        SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASSWD');
        FLUSH PRIVILEGES;
END
fi

exec mysqld --user=mysql --console
