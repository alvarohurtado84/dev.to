#!/bin/bash


echo '*********'
echo 'APT GET UPDATE SH'
echo '*********'


echo 'Update Apt-Get'
sudo apt-get update
sudo apt update
apt list --upgradable
sudo apt install -y curl gnupg2 dirmngr git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
