#!/bin/bash


echo '*********'
echo 'CHANGE DIRECTORY SH'
echo '*********'

echo 'moving to /webapps/myApp'
cd /webapps/myApp

# bin/setup
#echo '1. Installing exceptions'
#sudo gem install racc -v '1.5.2' --source 'https://rubygems.org/'

# install all ruby dependencies
bundler install

# install foreman
gem list \"^foreman$\" -v 0.87.1 -i --silent || gem install foreman

# install javascript dependencies
bin/yarn
