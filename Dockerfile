FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y git make g++ gcc curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    git clone https://github.com/Koenkk/zigbee2mqtt.git /opt/zigbee2mqtt && \
    cd /opt/zigbee2mqtt && \
    npm ci && \
    (npm start || true)

WORKDIR /opt/zigbee2mqtt
VOLUME /opt/zigbee2mqtt/data
VOLUME /dev/zigbee

CMD npm start
