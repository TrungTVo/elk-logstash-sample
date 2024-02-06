# Use the official Logstash base image from Elastic
FROM docker.elastic.co/logstash/logstash:8.12.0

USER root

# Install Vim editor
RUN apt-get update && apt-get install -y vim

# Set the working directory
WORKDIR /usr/share/logstash

RUN rm -f ./pipeline/logstash.conf

# Expose ports 5044 and 9600
EXPOSE 5044 9600

# Mount pipeline and settings volumes
VOLUME /usr/share/logstash/pipeline/
VOLUME /usr/share/logstash/config/

COPY ./config/ ./config/
COPY ./pipeline/ ./pipeline/

# Command to run Logstash, select default configuration
# CMD ["bin/logstash", "-f", "/usr/share/logstash/pipeline/logstash2.conf"]