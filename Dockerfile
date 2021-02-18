FROM debian:buster
MAINTAINER Matthieu Escande mescande@student.42.fr

RUN mkdir /ft_server
WORKDIR /ft_server

EXPOSE 3000

RUN apt update
RUN apt install nginx -y
RUN apt install vim -y
RUN apt install mariadb-server -y
RUN apt install php-fpm php-mysql php7.3-gd php-ssh2 -y
RUN apt install wget -y

COPY ./srcs/install_wp.sh ./install_wp.sh
COPY ./srcs/wordpress/wp-config.php /wp-config.php
RUN ./install_wp.sh

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar xvzf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.4-all-languages.tar.gz
RUN cp -avr ./phpMyAdmin-5.0.4-all-languages/. /usr/share/phpmyadmin
RUN ln -s /usr/share/phpmyadmin/ /var/www/localhost/wordpress/phpmyadmin
#RUN chown -R :www-data /var/www/localhost/wordpress/phpmyadmin

COPY ./srcs/CMD.sh ./CMD.sh
COPY ./srcs/mysql_config.db ./mysql_config.db
COPY ./srcs/.vimrc /root/.vimrc
COPY ./srcs/.vim /root/.vim
#
#COPY ./srcs/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./srcs/nginx/default /etc/nginx/sites-available/default
RUN mv /var/www/html/* /var/www/localhost/wordpress/index.html
RUN rm -r /var/www/html
RUN ln -s /var/www/localhost/wordpress/ /var/www/html
#COPY ./srcs/nginx/availables_sites /etc/nginx/sites-available/localhost
#RUN cp /etc/nginx/sites-available/html/


CMD ./CMD.sh 
#a changer pour la correction
