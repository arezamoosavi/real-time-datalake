.PHONY: zookeeper click-cluster down

zookeeper:
	docker-compose up -d zookeeper kafka

create-topic:
	docker-compose exec zookeeper kafka-topics --create --zookeeper localhost:2181 \
	--replication-factor 1 --topic random_topic --partitions 4

check-topic:
	kafkacat -b localhost:29092 -t random_topic -C -O -o-1 | jq .

produce-topic:
	kafkacat -b localhost:29092 -t random_topic -P

consumer-state:
	docker-compose exec zookeeper \
	kafka-consumer-groups --bootstrap-server kafka:9092 \
	--group click_random1 --describe --verbose

click-cluster:
	docker-compose up -d clickhouse-01 clickhouse-02

trino-cluster:
	docker-compose up -d trino-master trino-worker

down:
	docker-compose down -v