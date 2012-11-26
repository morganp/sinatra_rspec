# Might need to base it on this:
#http://github.com/zapnap/sinatra-template/blob/master/spec/spec_helper.rb


require 'rubygems'
require 'sinatra'
require 'rack/test'
require 'rspec'
require 'rspec/autorun'
#require 'rspec/interop/test'

# set test environment
Sinatra::Base.set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

require File.join(File.dirname(__FILE__), '..', 'myapp.rb')

