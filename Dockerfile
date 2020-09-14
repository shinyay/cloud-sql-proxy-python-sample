# https://hub.docker.com/_/python
FROM python:2.7.13
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
  && apt-get install -y mysql-server --no-install-recommends \
  && apt-get clean \
  && pip install PyMySQL \
  && pip install MySQL-python \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

CMD python app.py
