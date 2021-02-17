FROM debian:buster
MAINTAINER Matthieu Escande mescande@student.42.fr

RUN mkdir /cmd

WORKDIR /cmd

EXPOSE 3000

RUN apt update
RUN apt install nginx -y
RUN apt install vim -y
RUN apt install mariadb-server -y
RUN apt install php-fpm php-mysql -y

COPY ./srcs/CMD.sh ./CMD.sh
COPY ./srcs/mysql_config.db ./mysql_config.db
COPY ./srcs/.vimrc /root/.vimrc
COPY ./srcs/.vim /root/.vim
COPY ./srcs/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./srcs/nginx/default /etc/nginx/sites-enabled/default
COPY ./srcs/nginx/availables_sites /etc/nginx/sites-available/localhost

CMD ./CMD.sh
