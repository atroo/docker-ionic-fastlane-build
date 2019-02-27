FROM lovato/docker-android:latest

MAINTAINER Martin Foerster <martin@atroo.de>

ENV NODEJS_VERSION=8.12.0 \
    PATH=$PATH:/opt/node/bin

WORKDIR "/opt/node"

RUN apt-get update && apt-get install -y curl git ca-certificates ruby-full less build-essential --no-install-recommends && \
    curl -sL https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN gem install fastlane -NV

ENV CORDOVA_VERSION 8.0.0
ENV IONIC_VERSION 3.20.1

WORKDIR "/tmp"

RUN npm i -g --unsafe-perm cordova@${CORDOVA_VERSION}
RUN npm i -g --unsafe-perm ionic@${IONIC_VERSION}

