.PHONY: zookeeper click-cluster down

zookeeper:
	docker-compose up -d zookeeper

click-cluster:
	docker-compose up -d clickhouse-01 clickhouse-02

trino-cluster:
	docker-compose up -d trino-master trino-worker

down:
	docker-compose down -v