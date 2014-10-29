FROM ubuntu:14.04	
MAINTAINER Carsten Ehbrecht <ehbrecht@dkrz.de>	

RUN apt-get update
RUN apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository ppa:nginx/stable
RUN apt-get update 
RUN apt-get install -y nginx

EXPOSE 80 443	
CMD /usr/sbin/nginx -g 'daemon off;'
