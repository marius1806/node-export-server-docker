FROM ubuntu:latest

RUN apt-get update -y &&\
    apt-get install -y curl git bzip2 &&\
    curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash &&\
    export NVM_DIR="$HOME/.nvm" &&\
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" &&\
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" &&\
    nvm install 14.21.3 &&\
    git clone https://github.com/highcharts/node-export-server &&\
    cd node-export-server &&\
    npm install &&\
    npm link &&\
    ln -s `which nodejs` /usr/bin/node &&\
    export PATH="~/.nvm/versions/node/v14.21.3/bin:$PATH"

EXPOSE 7801

ENTRYPOINT [ "highcharts-export-server", "--enableServer 1",  "--port 7801" ]