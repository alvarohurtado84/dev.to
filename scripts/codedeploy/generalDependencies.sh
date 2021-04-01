#!/bin/bash


echo '*********'
echo 'DEPENDENCIES (NODE, YARN, IMAGEMAGICK)'
echo '*********'


echo 'Install Node.Js'
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs

echo 'Install Yarn'
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install -y yarn

echo 'Install ImageMagick'
apt install imagemagick -y

echo 'Need this, otherwise Gem pg fails'
sudo apt-get install libpq-dev -y
