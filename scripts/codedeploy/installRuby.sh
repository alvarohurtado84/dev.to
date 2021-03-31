#!/bin/bash

echo 'Install Rbenv'
sudo apt install rbenv

echo 'Install Ruby'
rbenv install $(cat .ruby-version)

echo 'Test Rbenve + Ruby'
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
