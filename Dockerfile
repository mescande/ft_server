FROM debian:buster
MAINTAINER Matthieu Escande mescande@student.42.fr

RUN mkdir /cmd

WORKDIR /cmd

EXPOSE 3000

RUN echo "here we are"
RUN apt update
RUN apt install nginx -y

COPY ./srcs/CMD.sh /cmd/CMD.sh

CMD ./CMD.sh
