require 'rubygems'
require 'sinatra'
require 'json'

$statuses = []

enable :static

get '/' do
  send_file settings.public_folder + '/index.html'
end

post '/statuses' do
  $statuses << params
  params.to_json
end

get '/statuses' do
  $statuses.to_json
end
