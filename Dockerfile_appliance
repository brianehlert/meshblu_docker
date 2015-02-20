# this builds a single container to run Meshblu locally, with Redis and MongoDB.  Any data persistence is written to the container itself.
# sudo docker build github.com/brianehlert/meshblu.git 
# sudo docker images   ( find the image ID )
# sudo docker run -t -p 3000:3000 -p 5683:5683 -p 1883:1883 <image id>    # direct maps localhost ports to container listener ports
# Check Status:  curl http://localhost:3000/status

# latest ubuntu image
FROM ubuntu:latest

MAINTAINER BrianEh

# install dependencies
RUN apt-get update && apt-get install -y \
	build-essential \
	redis-server \
	apt-utils \
	supervisor \
	nodejs \
	nodejs-legacy \
	npm \
	libavahi-compat-libdnssd-dev

# install Mongo
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
RUN apt-get update && apt-get install -y mongodb-10gen

# redis to run a daemon
RUN sed -i 's/daemonize yes/daemonize no/g' /etc/redis/redis.conf

# logging directory
RUN mkdir /var/log/skynet

# copy the meshblu pull to /var/www
COPY . /var/www

# install Meshblu
RUN cd /var/www && npm install
COPY ./docker/config.js.docker /var/www/config.js
COPY ./docker/supervisor.conf /etc/supervisor/conf.d/supervisor.conf

# open ports
EXPOSE 3000 5683 1883

# configure Meshblu to run on start of container
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"] 
