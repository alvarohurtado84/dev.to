#!/bin/bash


echo '*********'
echo 'INSTALL RUBY SH'
echo '*********'


echo 'Install Rbenv'
apt install rbenv ruby-build

echo '1. Update Rbenv and ruby-build'
echo '1.1. Remove .rbenv'
rm -rf /root/.rbenv
echo '1.2. Clone repo rbenv'
git clone https://github.com/rbenv/rbenv.git /root/.rbenv
echo '1.3. Export and eval to .bashrc'
echo 'export PATH="/root/.rbenv/bin:$PATH"' >> /root/.bashrc
echo 'eval "$(rbenv init -)"' >> /root/.bashrc
echo '1.4. Exec Shell'
exec $SHELL

echo '1.5. Remove ruby-build'
rm -rf /root/.rbenv/plugins/ruby-build
echo '1.6. Clone ruby-build'
git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
echo '1.7. Export ruby-build'
echo 'export PATH="/root/.rbenv/plugins/ruby-build/bin:$PATH"' >> /root/.bashrc
echo '1.8. Exec Shell'
exec $SHELL

echo '2. Install Ruby'
rbenv install -v -f $(cat /webapps/myApp/.ruby-version)

echo '3. Set as global'
rbenv global $(cat /webapps/myApp/.ruby-version)

echo '4. Install bundler'
gem install bundler

echo '5. Rehash rbenv'
rbenv rehash

echo '6. Test Rbenv + Ruby'
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
