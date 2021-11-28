Rails.application.routes.draw do
  root 'start_screen#index', as: 'home'
  get  '/home', to: 'start_screen#index'
  get '/movie', to: 'movie#index', as: 'movie'
  get '/search', to: 'movie_collection#index', as: 'search'
end
