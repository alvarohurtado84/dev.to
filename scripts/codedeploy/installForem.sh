#!/bin/bash


echo '*********'
echo 'CHANGE DIRECTORY SH'
echo '*********'

echo 'moving to /webapps/myApp'
cd /webapps/myApp

# bin/setup
#echo '1. Installing exceptions'
#sudo gem install racc -v '1.5.2' --source 'https://rubygems.org/'

# ruby dependencies creating problems:
echo 'Installing unf_ext...'
sudo gem install unf_ext

echo 'Installing sassc...'
sudo gem install sassc

# install all ruby dependencies
echo 'Installing the rest of the gemfile...'
sudo bundle install

# install foreman
echo 'Install foreman'
sudo gem install foreman -v 0.87.1
#gem list \"^foreman$\" -v 0.87.1 -i --silent || gem install foreman

# install javascript dependencies
# (not sure if this is working fine)
echo 'Execute bin/yarn'
bin/yarn
