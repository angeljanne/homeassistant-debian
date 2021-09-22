FROM python:3.9.7
MAINTAINER angeljanne
ENV HASS_VERSION="2021.9.7"
LABEL version=${HASS_VERSION}

ADD startContainer /usr/bin/startContainer
ADD pip.conf /root/.pip/pip.conf

RUN mkdir /config && \
    cp /etc/apt/sources.list /etc/apt/sources.list_bak && \
    sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install libpcap-dev -y && \
    pip3 install wheel && \
    pip3 install homeassistant==${HASS_VERSION}

WORKDIR /config

VOLUME /config

EXPOSE 8123

CMD ["/bin/bash", "/usr/bin/startContainer"]
