require 'sinatra'
require 'pp'  # Pretty print

set :port, 5555

get '/' do
  puts 'Request headers:'
  puts request.env.class
  puts params
  pp request.env
  'User agent: ' + request.env['HTTP_USER_AGENT']
end