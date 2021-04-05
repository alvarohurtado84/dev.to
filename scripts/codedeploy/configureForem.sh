#!/bin/bash


echo '*********'
echo 'SETS ENV VARIABLES'
echo '*********'


# go to the main source directory
cd /webapps/myApp/

# execute the ruby script to create .env
ruby scripts/codedeploy/getEnvVariables.rb

echo "== Preparing Test Elasticsearch =="
RAILS_ENV="development" bin/rails search:setup

echo "== Initializing the application =="
bin/rails app_initializer:setup forem:setup

echo "== Removing old logs and tempfiles =="
bin/rails log:clear tmp:clear

echo "== Starting puma application server =="
system! "bin/rails restart"
