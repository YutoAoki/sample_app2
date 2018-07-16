Rails.application.routes.draw do

  get 'topics/new'

  get 'topisc/new'


  # get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get '/help', to:'static_pages#help'
  get 'about', to:'static_pages#about'
  get 'signup', to:'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :users
  resources :topics
  post '/miles', to: 'miles#create'
  # get 'topics/index', to: 'topics#index'


end
