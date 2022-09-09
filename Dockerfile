FROM ubuntu:latest
MAINTAINER Serdar Sarioglu, Serdar.Sarioglu@mysystem.org

# Install Basic Tools
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y build-essential ca-certificates wget curl git docker  mysql-client redis-tools nmap zmap dnsutils htop 
