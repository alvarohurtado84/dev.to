#!/bin/bash


echo '*********'
echo 'START PUMA SERVER'
echo '*********'


# go to the main source directory
cd /webapps/myApp/

# took this command from the Procfile
# it might need daemonization, not sure how yet
bin/bundle exec puma -C config/puma.rb &
