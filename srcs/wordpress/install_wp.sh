mkdir /var/www/localhost
cd /var/www/localhost
wget http://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
rm latest.tar.gz
mkdir wordpress/wp-content/uploads
mv /ft_server/wordpress/wp-config.php ./wordpress/
chown -R :www-data /var/www/localhost
