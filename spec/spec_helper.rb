
# Reworked per http://www.sinatrarb.com/testing.html#frameworks

require 'sinatra'
require 'rack/test'
require 'rspec'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

# Requiring app file here(!) removed for reusability

