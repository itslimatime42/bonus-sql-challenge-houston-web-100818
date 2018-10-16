require 'bundler'
require 'base64'

Bundler.require

# Setup a DB connection here
require_relative '../db/sql_runner'
require_relative '../lib/queries.rb'
