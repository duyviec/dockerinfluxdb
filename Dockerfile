FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive
ENV CONFIG_FILE /config/config.toml
#install needed library
RUN apt-get update -y
RUN apt-get install --fix-missing software-properties-common -y
RUN apt-get install wget -y
RUN wget http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
RUN dpkg -i influxdb_latest_amd64.deb

ADD config.toml /config/config.toml
COPY config.toml /config.toml

EXPOSE 8083 8086 8090 8090
VOLUME ["/data"]

CMD /usr/bin/influxdb -config=config.toml
