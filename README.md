# Use Docker Compose

```
docker compose up
```

Or build and run 2 separate containers as follow:

# Filebeat:

Build

```
docker build -t trungtvo/custom-filebeat:1.0 -f ./filebeat/Dockerfile .
```

Run Container

```
docker run --rm -it \
--name my-filebeat-ctn \
--user root \
-v ./filebeat/filebeat.yml:/usr/share/filebeat/filebeat.yml \
-v ./workspace_data/:/usr/share/filebeat/workspace_data/ \
trungtvo/custom-filebeat:1.0 \
filebeat -e --strict.perms=false
```

# Logstash

Build

```
docker build -t trungtvo/custom-logstash:1.0 -f ./logstash/Dockerfile .
```

Run Container

```
docker run --rm -it -p 5044:5044 -p 9600:9600 \
    -v ./logstash/config/:/usr/share/logstash/config/ \
    -v ./logstash/pipeline/:/usr/share/logstash/pipeline/ \
    -v ./workspace_data/:/usr/share/logstash/workspace_data/ \
    --name my-logstash-ctn \
    trungtvo/custom-logstash:1.0
```
