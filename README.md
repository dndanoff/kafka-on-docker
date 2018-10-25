# Usefull commands when starting Kafka on Docker

## Run with Docker Compose

Move to any of the folders containing docker-compose.yml file.<br>
Folders bring up different stacks. They start from zookeeper, kafka and schema registry and are enhanced to zookeeper, kafka, schema registry, rest proxy, kafka connect, topic-ui, connect-ui, scheam-ui.

- Start kafka platform: <br>
`docker-compose up -d`

- Optional create and check topic: <br>
`docker-compose exec kafka kafka-topics --create --topic foo --partitions 1 --replication-factor 1 --if-not-exists --zookeeper zookeper:2181` <br>
`docker-compose exec kafka kafka-topics --describe --topic foo --zookeeper zookeper:2181` <br>
`docker-compose exec kafka bash -c "seq 42 | kafka-console-producer --request-required-acks 1 --broker-list kafka:9092 --topic foo && echo 'Produced 42 messages.'"` <br>
`docker-compose exec kafka kafka-console-consumer --bootstrap-server kafka:9092 --topic foo --new-consumer --from-beginning --max-messages 42` <br>

- Stop platform: <br>
`docker-compose rm -s -f -v`

## Run with Docker CLI

Run docker for windows with linux containers <br>
https://docs.confluent.io/current/installation/docker/docs/installation/single-node-client.html <br>

- Create network: <br>
`docker network create confluent` <br>

- Start zookeeper: <br>
`docker run -d --net=confluent --name=zookeeper -e ZOOKEEPER_CLIENT_PORT=2181 confluentinc/cp-zookeeper:5.0.0` <br>

- Check zookeeper: <br>
`docker logs zookeeper` <br>

- Start kafka: <br>
`docker run -d --net=confluent --name=kafka -e KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092 -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 confluentinc/cp-kafka:5.0.0` <br>

- Check kafka: <br>
`docker logs kafka` <br>

- Start schema registry: <br>
`docker run -d --net=confluent --name=schema-registry -e SCHEMA_REGISTRY_KAFKASTORE_CONNECTION_URL=zookeeper:2181 -e SCHEMA_REGISTRY_HOST_NAME=schema-registry -e SCHEMA_REGISTRY_LISTENERS=http://0.0.0.0:8081 confluentinc/cp-schema-registry:5.0.0` <br>

- Check schema registry: <br>
`docker logs schema-registry` <br>

- Optional create and check topic: <br>
`docker run --net=confluent --rm confluentinc/cp-kafka:5.0.0 kafka-topics --create --topic foo --partitions 1 --replication-factor 1 --if-not-exists --zookeeper zookeeper:2181` <br>
`docker run --net=confluent --rm confluentinc/cp-kafka:5.0.0 kafka-topics --describe --topic foo --zookeeper zookeeper:2181` <br>