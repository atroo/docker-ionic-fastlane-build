FROM lovato/docker-android:latest

MAINTAINER Martin Foerster <martin@atroo.de>

ENV NODEJS_VERSION=12.14.1 \
    RUBY_VERSION=2.7 \
    CORDOVA_VERSION=8.1.2 \
    FASTLANE_VERSION=2.140 \
    BUNDLER_VERSION=2.1.4 \
    PATH=$PATH:/opt/node/bin
 
ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8

WORKDIR "/opt/node"

RUN apt-get update && apt-get install -y curl git ca-certificates less build-essential --no-install-recommends && \
    curl -sL https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean
    
RUN wget http://ftp.ruby-lang.org/pub/ruby/${RUBY_VERSION}/ruby-${RUBY_VERSION}.0.tar.gz && \
    tar -xzvf ruby-${RUBY_VERSION}.0.tar.gz && cd ruby-${RUBY_VERSION}.0/ && ./configure && \
    make && make install && ruby -v

RUN gem install fastlane:${FASTLANE_VERSION}
RUN gem install bundler:${BUNDLER_VERSION}

WORKDIR "/tmp"

RUN npm i -g --unsafe-perm cordova@${CORDOVA_VERSION}
