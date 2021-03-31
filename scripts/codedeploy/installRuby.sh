#!/bin/bash

echo 'Install Rbenv'
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

echo 'Update Rbenv ruby-build list'
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

echo 'Install Ruby'
rbenv install $(cat /webapps/myApp/.ruby-version)

echo 'Set as global'
rbenv global $(cat /webapps/myApp/.ruby-version)

echo 'Install bundler'
gem install bundler

echo 'Rehash rbenv'
rbenv rehash

echo 'Test Rbenv + Ruby'
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
