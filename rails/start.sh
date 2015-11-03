#!/bin/sh

cd /rails
rails new $PROJECT
cd $PROJECT
sed -ri "s/^# gem 'therubyracer'(.*)/gem 'therubyracer', platforms: :ruby/g" Gemfile
bundle install

rails s -b 0.0.0.0 -e development
