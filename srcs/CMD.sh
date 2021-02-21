if [ "${AUTOINDEX}" = "off" ]; then
	echo "Disable autoindex"
	sed -i 's/autoindex on;//g' /etc/nginx/sites-available/default
fi
service nginx start
service mysql start
service php7.3-fpm start
mysql -u root < mysql_config.db
bash
