FROM node:16-bullseye

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl git bzip2 && \
    rm -rf /var/lib/apt/lists/*
    ln -s `which nodejs` /usr/bin/node &&\
    git clone https://github.com/highcharts/node-export-server.git

WORKDIR $HOME/node-export-server/

ENV ACCEPT_HIGHCHARTS_LICENSE YES

RUN npm install -y &&\
    npm link

ENV OPENSSL_CONF=/etc/ssl/

EXPOSE 80

ENTRYPOINT [ "highcharts-export-server",  "--enableServer",  "1",  "--port", "80" ]
