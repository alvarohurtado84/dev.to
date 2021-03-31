#!/bin/bash


echo '*********'
echo 'INSTALL RUBY SH'
echo '*********'


echo 'Install Rbenv'
apt install rbenv ruby-build

echo 'Update Rbenv and ruby-build'
rm -rf /root/.rbenv
git clone https://github.com/rbenv/rbenv.git /root/.rbenv
echo 'export PATH="/root/.rbenv/bin:$PATH"' >> /root/.bashrc
echo 'eval "$(rbenv init -)"' >> /root/.bashrc
exec $SHELL

rm -rf /root/.rbenv/plugins/ruby-build
git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
echo 'export PATH="/root/.rbenv/plugins/ruby-build/bin:$PATH"' >> /root/.bashrc
exec $SHELL

echo 'Install Ruby'
rbenv install -v -f $(cat /webapps/myApp/.ruby-version)

echo 'Set as global'
rbenv global $(cat /webapps/myApp/.ruby-version)

echo 'Install bundler'
gem install bundler

echo 'Rehash rbenv'
rbenv rehash

echo 'Test Rbenv + Ruby'
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
