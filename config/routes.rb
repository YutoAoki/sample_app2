Rails.application.routes.draw do

  get 'comments/new'

  get 'topics/new'

  get 'topisc/new'


  # get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get '/help', to:'static_pages#help'
  get 'about', to:'static_pages#about'
  get 'omikuji', to: 'static_pages#omikuji'
  get 'signup', to:'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :users
  resources :topics
  resources :relationships
  resources :comments
  post '/miles', to: 'miles#create'
  get '/miles', to: 'miles#show'
  get '/topic_users/:id', to: "topics#users_index", as: "topic_users"
  # resources :miles
  # get 'topics/index', to: 'topics#index'


end
