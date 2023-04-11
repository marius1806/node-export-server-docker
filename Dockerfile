FROM node:14-alpine

RUN apk update &&\
    apk add --update curl git bzip2 bash &&\
    git clone https://github.com/highcharts/node-export-server &&\
    cd node-export-server &&\
    npm install &&\
    npm link &&\
    ln -s `which nodejs` /usr/bin/node

EXPOSE 80

ENTRYPOINT [ "highcharts-export-server", "--enableServer", "1",  "--port", "80" ]