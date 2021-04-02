#!/bin/bash


echo '*********'
echo 'DEPENDENCIES (NODE, YARN, IMAGEMAGICK)'
echo '*********'


echo 'Install Node.Js'
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs

sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo n 14.14

# Another alternative
#curl -s -O https://deb.nodesource.com/node_4.x/pool/main/n/nodejs/nodejs_4.2.3-1nodesource1~trusty1_amd64.deb
#sudo apt-get install rlwrap
#sudo dpkg -i nodejs_4.2.3-1nodesource1~trusty1_amd64.deb


echo 'Install Yarn'
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install -y yarn

echo 'Install ImageMagick'
apt install imagemagick -y

echo 'Need this, otherwise Gem pg fails'
sudo apt-get install libpq-dev -y

echo 'Needed for the Paramater Store'
sudo gem install aws-sdk
