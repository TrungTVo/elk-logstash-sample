# Use the official Logstash base image from Elastic
FROM docker.elastic.co/logstash/logstash:9.1.1

# USER root

# Install Vim editor
# RUN apt update && apt install -y vim

# Set the working directory
WORKDIR /usr/share/logstash

RUN rm -f ./pipeline/logstash.conf

# Expose ports 5044 and 9600
EXPOSE 5044 9600

# Mount pipeline and settings volumes
VOLUME /usr/share/logstash/pipeline/ \
    /usr/share/logstash/config/ \
    /usr/share/logstash/workspace_data/

COPY ./ ./

# Command to run Logstash, select default configuration
# CMD ["bin/logstash", "-f", "/usr/share/logstash/pipeline/logstash2.conf"]