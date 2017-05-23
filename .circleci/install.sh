#!/bin/bash

set -e


# setup for Docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"


# install OS dependencies
apt-get update

apt-get install -y --no-install-recommends \
  apt-transport-https \
  ca-certificates \
  curl \
  docker-ce \
  gnupg2 \
  locales \
  software-properties-common


# fix Meteor/Mongo locale issue on Debian
# https://github.com/meteor/meteor/issues/4019
locale-gen en_US.UTF-8
localedef -i en_GB -f UTF-8 en_US.UTF-8


# install Meteor if it's not already
hash meteor 2>/dev/null || curl https://install.meteor.com | /bin/sh


# install Reaction CLI
npm i -g reaction-cli
