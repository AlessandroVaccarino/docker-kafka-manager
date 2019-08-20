# Yahoo Kafka Manager Docker container

## What is Yahoo Kafka Manager Docker container project?
A complete installation of [Yahoo Kafka Manager](https://github.com/yahoo/kafka-manager) into a Docker container. Just run and enjoy.

### Run the container

To run your first Kafka Manager container, just type:

`docker run -p 9000:9000 -it -d alessandrov87/kafkamanager`

It will download the latest version of Yahoo Kafka Manager Docker image available, create a container, start Kafka Manager and expose web interface on port 9000.
So, after your container starts, go to `https://localhost:9000/` to reach Yahoo Kafka Manager web interface.

![Kafka Manager Homepage](https://github.com/AlessandroVaccarino/docker-kafka-manager/blob/master/bin/doc010.png)

By default, the container will search for a Zookeeper instance to connect to, on `localhost:2181`
To change Zookeeper address, use `ZK_HOSTS` envinronment variable.
E.g.:

`docker run -p 9000:9000 -e ZK_HOSTS=zookeeper:2181 -it -d alessandrov87/kafkamanager`

If you need a full working stack, use attached `docker-compose.yml` file with `docker-compose up` (refer to [Official Docker Website](https://docs.docker.com/compose/) for documentation).
It will create and launch 3 containers:
- Apache Zookeeper
- Apache Kafka
- Yahoo Kafka Manager

### Connect to Kafka instance

After connecting to your Kafka Manager Web Interface, you'll note that cluster list is empty.
To connect to a Kafka instance, click on *Cluster*, then *Add Cluster*:

![Kafka Add Cluster](https://github.com/AlessandroVaccarino/docker-kafka-manager/blob/master/bin/doc020.png)

A new page will appear. Here, specify at least:
- The name of the cluster
- The zookeeper instance, as *hostnane*:*port*
Then click Save. The new cluster will appear

![Kafka New Cluster](https://github.com/AlessandroVaccarino/docker-kafka-manager/blob/master/bin/doc030.png)
