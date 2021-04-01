#!/bin/bash


echo '*********'
echo 'INSTALL RUBY SH'
echo '*********'


#echo 'Install Rbenv'
#apt install rbenv ruby-build
#
#echo '1. Update Rbenv and ruby-build'
#echo '1.1. Remove .rbenv'
#rm -rf /root/.rbenv
#echo '1.2. Clone repo rbenv'
#git clone https://github.com/rbenv/rbenv.git /root/.rbenv
#echo '1.3. Export and eval to .bashrc'
#echo 'export PATH="/root/.rbenv/bin:$PATH"' >> /root/.bashrc
#echo 'eval "$(rbenv init -)"' >> /root/.bashrc
#
#echo '1.4. Export rbenv'
#export PATH="/root/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
#

#
#echo '1.5. Remove ruby-build'
#rm -rf /root/.rbenv/plugins/ruby-build
#echo '1.6. Clone ruby-build'
#git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
#echo '1.7. Export ruby-build'
#echo 'export PATH="/root/.rbenv/plugins/ruby-build/bin:$PATH"' >> /root/.bashrc

#
#echo '1.8. Export ruby-build'
#export PATH="/root/.rbenv/plugins/ruby-build/bin:$PATH"
#
#echo '2. Install Ruby'
#rbenv install -v -f $(cat /webapps/myApp/.ruby-version)
#
#echo '3. Set as global'
#rbenv global $(cat /webapps/myApp/.ruby-version)


#echo '1. Download ruby'
#curl https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.2.zip --output ruby-2.7.2.zip
#unzip ruby-2.7.2.zip
#cd ruby-2.7.2
#
#echo '2. Configure'
#./configure
#
#echo '3. Make and Make Check'
#make
#? make check
#
#echo '4. Make install'
#make install
#
#echo '5. Install bundler'
#gem install bundler


echo '6. Adding alternatives'
# This is GOLD - https://www.brightbox.com/docs/ruby/ubuntu/#switching-the-default-ruby-version
#apt-get remove ruby -y
apt-get install software-properties-common
apt-add-repository ppa:brightbox/ruby-ng -y
apt-get update
apt-get upgrade ruby2.7 -y
#apt-get install ruby-switch
#ruby-switch --set ruby2.7

#echo '5. Rehash rbenv'
#rbenv rehash
#
#echo '6. Test Rbenv + Ruby'
#curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
