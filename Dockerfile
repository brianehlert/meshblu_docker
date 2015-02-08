# this builds a single container to run Meshblu locally
# sudo docker build
# sudo docker images   ( find the image ID )
# sudo docker run -t -p 3000:3000 -p 5683:5683 -p 1883:1883 <image id> /usr/bin/node /var/www/server.js --http --coap --mqtt
# Check Status:  curl http://localhost:3000/status

# latest ubuntu image
FROM ubuntu:latest

MAINTAINER BrianEh

# install dependencies
RUN apt-get update && apt-get install -y \
	build-essential \
	apt-utils \
	nodejs \
	nodejs-legacy \
	npm \
	libavahi-compat-libdnssd-dev

# logging directory
RUN mkdir /var/log/skynet

# copy the meshblu pull to /var/www
COPY . /var/www

# install Meshblu
RUN cd /var/www && npm install

# configure
COPY ./docker/config.js /var/www/config.js

# open ports
EXPOSE 3000 5683 1883


