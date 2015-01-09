# ownCloud7

## Stack

* Ubuntu 14.04 LTS
* MariaDB 5.5
* Nginx 1.6
* ownCloud 7

* Apache 2.4
* MySQL 5.6
* lighttpd 1.4


## SSL

* self-signed SSL certificate with OpenSSL 1.0
* Signed SSL certificate


## git

git clone https://github.com/mthpvg/owncloud7.git
git clone git@github.com:mthpvg/owncloud7.git

## openstack

https://community.runabove.com/kb/en/object-storage/how-to-configure-owncloud-7-with-swift.html
sudo vi /etc/php5/fpm/php.ini
	upload_max_filesize = 6144M
	post_max_size = 6144M

## Debugging

problem
sudo service php5-fpm restart
stop: Unknown instance: 

solution
sudo pkill -KILL -f php-fpm
sudo service php5-fpm stop
sudo service php5-fpm start