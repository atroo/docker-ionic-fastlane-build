FROM lovato/docker-android:latest

MAINTAINER Martin Foerster <martin@atroo.de>

ENV NODEJS_VERSION=12.14.1 \
    RUBY_VERSION=2.7 \
    CORDOVA_VERSION=8.1.2 \
    FASTLANE_VERSION=2.142.0 \
    BUNDLER_VERSION=2.1.4 \
    PATH=$PATH:/opt/node/bin
 
ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8

WORKDIR "/opt/node"

RUN apt-get update && apt-get install -y curl git ca-certificates less build-essential --no-install-recommends && \
    curl -sL https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean
    
RUN gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && curl -sSL https://get.rvm.io | bash -s stable --ruby

RUN source /usr/local/rvm/scripts/rvm

RUN rvm install 2.7 && rvm use 2.7 --default

RUN gem install fastlane -NV

WORKDIR "/tmp"

RUN npm i -g --unsafe-perm cordova@${CORDOVA_VERSION}
