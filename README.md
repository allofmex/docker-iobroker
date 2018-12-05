# Docker ioBroker

This runs [http://www.iobroker.net] in a docker container.
Tested on standard x86 hardware. All existing projects that I found where not working anymore or targeting RaspberryPi or specific NAS systems. 

This container should run on a standard (Docker) Unix system.

### Installation

- Download repository (or download files manually)
```sh
$ git clone https://github.com/allofmex/docker-iobroker.git
$ cd docker-iobroker
```

- Edit docker-compose.yml
```sh
nano docker-compose.yml
```

Make sure you adjust "volumes:" section to your needs. The host directory will hold all iobroker files outside of container.

**Note:** it may be sufficient to keep only /opt/iobroker/iobroker-data folder outside of your container. Not sure...

### First Setup

Only needed on first run:
This will download and install ioBroker
```sh
$ docker-compose run service /setup_broker.sh

```
After this command, your hosts directory should contain multiple new files.

**Optional:** But you should run this step here too to update admin adapter. We can not do this within web interface, because it would stop admin interface, what in turn would stop our container. (Other adapter can be updated later in ioBroker)

```sh
$ docker-compose run  service /bin/bash /opt/iobroker/iobroker upgrade admin
```

### Startup ioBroker container
Now we start ioBroker
```sh
$ docker-compose up

```
Output should look like:
```
service_1  | Starting iobroker controller daemon...
service_1  | iobroker controller daemon started. PID: 13
service_1  | starting. Version 3.5.10 in /opt/iobroker/node_modules/iobroker.admin, node: v8.14.0
service_1  | requesting all states
service_1  | requesting all objects
service_1  | Request actual repository...
service_1  | received all states
service_1  | received all objects
service_1  | http server listening on port 8081
service_1  | Use link "http://localhost:8081" to configure.
service_1  | Subscribe OBJECTS: *
service_1  | Subscribe STATES: system.adapter.*
service_1  | Subscribe STATES: system.host.*
service_1  | Subscribe STATES: *.info.connection
service_1  | Subscribe OBJECTS: system.adapter.*
service_1  | Subscribe OBJECTS: system.host.*
service_1  | Subscribe LOGS
service_1  | Change log subscriber state: true

```

Login to ioBroker via browser
[http://YOUR-IP:9181/]

Go to tab Adapters and add adapter "Visualisation".

Go to [http://YOUR-IP:9182/]
Here you find the visualisation(Editor) page to create your own ioBroker interface.

If all is fine, you may run you container next time with
```sh
$ docker-compose up -d
```
to keep it running.

### Debugging
In case of problems, you can login to container by
```sh
$ docker exec -it dockeriobroker_service_1 bash
```

This instructions may help: 
[http://www.iobroker.net/docu/?page_id=3928]

Especially
```sh
netstat -n -a -p TCP
```
was very helpfull for me...
To use netstat, you may need first
```sh
 apt-get install net-tools
```
Node versions seem to be tricky too.


License
----

MIT

