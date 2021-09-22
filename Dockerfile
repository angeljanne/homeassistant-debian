FROM python:3.9.7
MAINTAINER angeljanne
ENV HASS_VERSION="2021.9.7"
LABEL version=${HASS_VERSION}

ADD startContainer /usr/bin/startContainer

RUN mkdir /config && \
    pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple/ wheel && \
    pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple/ homeassistant==${HASS_VERSION}

WORKDIR /config

VOLUME /config

EXPOSE 8123

CMD ["/bin/bash", "/usr/bin/startContainer"]
