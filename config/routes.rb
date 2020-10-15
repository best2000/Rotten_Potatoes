Rails.application.routes.draw do
  root 'movies#index'

  get "/auth/:provider/callback" => "sessions#create"
  get "/users/logout" => "sessions#destroy", :as => "logout"

  post '/reviews/update/:id' => 'reviews#update'

  post '/movies/update/:id' => 'movies#update'
 
  get "/users/:id" => "users#user_index" 
  get '/movies/partialGet' => 'movies#partialGet', as: 'partialGet'

  get '/movies/tmdb_new' => 'movies#tmdb_new'

  get '/movies/tmdb_search' => 'movies#tmdb_search'
  
  resources :movies
  resources :reviews

  
  
end
