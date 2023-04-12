FROM node:16-bullseye

RUN apt-get update &&\
    apt-get install curl git bzip2 bash &&\
    ln -s `which nodejs` /usr/bin/node &&\
    git clone https://github.com/highcharts/node-export-server.git

WORKDIR $HOME/node-export-server/

RUN npm install -y &&\
    npm link

ENV OPENSSL_CONF=/etc/ssl/

EXPOSE 80

ENTRYPOINT [ "highcharts-export-server",  "--enableServer",  "1",  "--port", "80" ]
