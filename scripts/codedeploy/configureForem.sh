#!/bin/bash


echo '*********'
echo 'SETS ENV VARIABLES'
echo '*********'


# go to the main source directory
cd /webapps/myApp/

# execute the ruby script to create .env
ruby scripts/codedeploy/getEnvVariables.rb
