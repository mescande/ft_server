FROM debian:buster
MAINTAINER Matthieu Escande mescande@student.42.fr

RUN mkdir /cmd

WORKDIR /cmd

EXPOSE 3000

RUN echo "here we are"
RUN apt update
RUN apt install nginx -y
RUN apt install vim -y
RUN apt install mariadb-server -y

COPY ./srcs/CMD.sh /cmd/CMD.sh
COPY ./srcs/.vimrc /root/.vimrc
COPY ./srcs/.vim /root/.vim
COPY ./srcs/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./srcs/nginx/default /etc/nginx/sites-enabled/default

CMD ./CMD.sh
