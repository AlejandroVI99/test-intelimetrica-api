#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails runner db/scripts/insert_restaurants.rb
