FROM node:8

MAINTAINER Allofmex <allofmex@web.de>

#RUN apt-get update

# Adjust timezone if needed
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ /etc/timezone

RUN mkdir /opt/iobroker
RUN chmod 777 /opt/iobroker

ADD run_broker.sh /run_broker.sh
ADD setup_broker.sh /setup_broker.sh
RUN chmod +x /run_broker.sh /setup_broker.sh

RUN useradd -m iobroker && echo "iobroker:iobroker" | chpasswd && adduser iobroker sudo

WORKDIR /opt/iobroker/

EXPOSE 8081 8082 8083 8084
CMD /run_broker.sh
