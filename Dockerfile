FROM debian:buster
MAINTAINER Matthieu Escande mescande@student.42.fr

RUN mkdir /ft_server
WORKDIR /ft_server

EXPOSE 80
EXPOSE 443

RUN apt update
RUN apt install nginx -y
RUN apt install vim -y
RUN apt install mariadb-server -y
RUN apt install php-fpm php-mysql php7.3-gd php-ssh2 -y
RUN apt install wget -y

RUN mkdir wordpress
ADD srcs/wordpress ./wordpress/
COPY srcs/ssl/ssl.conf ./ssl.conf
RUN ./wordpress/install_wp.sh
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ft_server.key -out /etc/ssl/certs/ft_server.crt < ssl.conf
RUN openssl dhparam -out /etc/nginx/dhparam.pem 4096

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar xvzf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.4-all-languages.tar.gz
RUN cp -avr ./phpMyAdmin-5.0.4-all-languages/. /usr/share/phpmyadmin
#RUN rm -r phpMyAdmin-5.0.4-all-languages
RUN ln -s /usr/share/phpmyadmin/ /var/www/localhost/phpmyadmin
#RUN chown -R :www-data /var/www/localhost/wordpress/phpmyadmin

ADD ./srcs/ ./
RUN cp .vimrc /root/.vimrc
RUN cp -r .vim /root/.vim
#
#COPY ./srcs/nginx/nginx.conf /etc/nginx/nginx.conf
RUN cp nginx/default /etc/nginx/sites-available/default
RUN mkdir /var/www/localhost/nginx
RUN mv /var/www/html/* /var/www/localhost/nginx/index.html
RUN rm -r /var/www/html
RUN ln -s /var/www/localhost/ /var/www/html

RUN cp ssl/ft_server.conf ssl/ssl-params.conf /etc/nginx/snippets/

CMD ./CMD.sh 
#a changer pour la correction
