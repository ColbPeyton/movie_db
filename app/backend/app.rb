require 'sinatra'

# http://localhost:4567/list/complete
get '/list/complete' do
  "complete list of movies"
end

# matches "GET /list/sort?direction=acc&prop=raiting"
get '/list/sort' do
  direction = params['direction']
  prop = params['prop']
end

# matches "GET /list/title?movie_id=12"
get '/list/title' do
  movie_id = params['movie_id']
end