Bundler.require :default

$statuses = []

enable :static

get '/' do
  send_file settings.public_folder + '/index.html'
end

post '/statuses' do
  data = JSON.parse(request.body.read)
  $statuses << data
  data.to_json
end

get '/statuses' do
  $statuses.to_json
end
