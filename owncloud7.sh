#!/bin/bash

domain='sub.domain.tld'

rootDirectory='/opt/owncloud'

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y mariadb-server
mysql_secure_installation
mysql -u root -p
#	CREATE DATABASE <DATABASE_NAME>;
#	GRANT ALL ON <DATABASE_NAME>.* to <DATABASE_USER>@localhost identified by '<USER_PASSWORD>';
#	FLUSH PRIVILEGES;
#	exit;
sudo apt-get install -y nginx php5-fpm php5-common php5-cli php5-json php5-mysql php5-curl php5-intl php5-mcrypt php5-memcache php5-gd
sudo cp nginxConfigFile /opt
cd /opt/
sudo wget http://download.owncloud.org/community/owncloud-latest.tar.bz2
sudo tar -jxvf owncloud-latest.tar.bz2
sudo rm -rf owncloud-latest.tar.bz2
sudo chown -R www-data:www-data /opt/owncloud
sudo mv nginxConfigFile $domain
sudo sed -i "s/<sub.domain.tld>/$domain/g" $domain
sudo sed -i "s/<root/directory>/$rootDirectory/g" $domain
sudo mv $domain /etc/nginx/sites-available


sudo sed -i "s#listen = /var/run/php5-fpm.sock#listen = 127.0.0.1:9000;#g" /etc/php5/fpm/pool.d/www.conf

sudo ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled
sudo mkdir -p /etc/ssl/nginx
cd /etc/ssl/nginx
sudo openssl genrsa -out $domain.key 1024
sudo openssl req -new -key $domain.key -out $domain.csr
sudo openssl x509 -req -days 1095 -in $domain.csr -signkey $domain.key -out $domain.crt

sudo service nginx restart
sudo service php5-fpm restart
