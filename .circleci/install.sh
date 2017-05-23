#!/bin/bash

set -e

# install OS dependencies
apt-get update
apt-get install -y locales


# fix Meteor/Mongo locale issue on Debian
# https://github.com/meteor/meteor/issues/4019
locale-gen en_US.UTF-8
localedef -i en_GB -f UTF-8 en_US.UTF-8


# install Meteor if it's not already
hash meteor 2>/dev/null || curl https://install.meteor.com | /bin/sh


# install Reaction CLI
npm i -g reaction-cli
