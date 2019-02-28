# docker-ionic-fastlane-build
[![Build Status](https://travis-ci.org/atroo/docker-ionic-fastlane-build.svg?branch=master)](https://travis-ci.org/atroo/docker-ionic-fastlane-build)

This docker image provides everything to bring ionic builds to your ci

This image is based on the android image from https://github.com/lovato/docker-android. 

## Usage

### General usage
```
docker pull atroo/docker-ionic-fastlane-build:ionic3
docker run -v $(pwd):/buildspace atroo/docker-ionic-fastlane-build:ionic3 ionic build android
```

### Gitlab CI
This image can be used in every docker runner. Just provide `atroo/docker-ionic-fastlane-build:ionic3` as the image name and alle commands from ionic, cordova and fastlane are available.

## Version overview
- android api levels 19-28
- node.js 8
- cordova 8
- ionic 3
- fastlane latest
