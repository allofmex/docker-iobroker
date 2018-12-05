FROM node:8

MAINTAINER Allofmex <allofmex@web.de>

#RUN apt-get update

RUN mkdir /opt/iobroker
RUN chmod 777 /opt/iobroker
RUN cd /opt/iobroker && npm install iobroker --unsafe-perm
RUN cd /opt/iobroker && npm i --production --unsafe-perm

ADD run_broker.sh /run_broker.sh
ADD setup_broker.sh /setup_broker.sh
RUN chmod +x /run_broker.sh /setup_broker.sh

WORKDIR /opt/iobroker/

EXPOSE 8081 8082 8083 8084
CMD /run_broker.sh
