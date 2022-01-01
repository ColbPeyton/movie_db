Rails.application.routes.draw do
  root 'start_screen#index', as: 'home'
  get  '/home', to: 'start_screen#index'
  get '/collection', to: 'movie_collection#index', as: 'collection'
  get '/collection/:id', to: 'movie_collection#show'

end
