#!/bin/bash


echo '*********'
echo 'UPGRADE RUBY TO 2.7.2'
echo '*********'


# This is GOLD - https://www.brightbox.com/docs/ruby/ubuntu/#switching-the-default-ruby-version

echo '1. Adding alternatives distro-repo'
apt-get install software-properties-common
apt-add-repository ppa:brightbox/ruby-ng -y

echo '2. Apt-get update'
apt-get update

echo '3. Upgrade Ruby to 2.7.2'
apt-get upgrade ruby2.7 -y
apt install ruby-dev -y

echo '4. Install bundler'
gem install bundler
