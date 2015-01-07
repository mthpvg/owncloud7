#owncloud7
owncloud 7 ubuntu 14.04 LTS nginX mariaDB self-signed SSL

git clone https://github.com/mthpvg/owncloud7.git

#openstack
https://community.runabove.com/kb/en/object-storage/how-to-configure-owncloud-7-with-swift.html
sudo vi /etc/php5/fpm/php.ini
	upload_max_filesize = 6144M
	post_max_size = 6144M

problem
sudo service php5-fpm restart
stop: Unknown instance: 

solution
sudo pkill -KILL -f php-fpm
sudo service php5-fpm stop
sudo service php5-fpm start