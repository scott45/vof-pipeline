## Pull the mysql:5.6 image
FROM ubuntu:latest

## The maintainer name and email
MAINTAINER Businge Scott <busingescott@gmail.com>

# Install requirement (wget)
RUN \
apt-get update && \
apt-get install -y git wget sudo curl

## Update packages and install requirements
 RUN sudo apt-get install -y --no-install-recommends git-core curl zlib1g-dev \
	  build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev \
	  sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev wget nodejs     \
	  python-software-properties libffi-dev sudo postgresql postgresql-contrib   \
	  libpq-dev

## Install ruby
RUN apt-get install -y ruby

RUN mkdir app

WORKDIR /app

## clone the repo
RUN \
git clone https://username:password@github.com/andela/vof-tracker.git 

## make virtualenv and install requirements
RUN gem install bundler --no-ri --no-rdoc  

# Make port 80 available to the world outside this container
EXPOSE 80

# Set proxy server, replace host:port with values for your servers
ENV http_proxy host:port
ENV https_proxy host:port
