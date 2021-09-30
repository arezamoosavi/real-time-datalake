CREATE TABLE queue1 (
    level String,
    message String
  ) ENGINE = Kafka SETTINGS kafka_broker_list = 'kafka:9092',
                            kafka_topic_list = 'random_topic',
                            kafka_group_name = 'click_random1',
                            kafka_format = 'JSONEachRow',
                            kafka_skip_broken_messages = 10000,
                            kafka_num_consumers = 4;

  CREATE TABLE queue2 (
    level String,
    message String
  ) ENGINE = Kafka('kafka:9092', 'random_topic', 'click_random2')
              SETTINGS kafka_format = 'JSONEachRow',
              kafka_skip_broken_messages = 10000,
              kafka_num_consumers = 4;