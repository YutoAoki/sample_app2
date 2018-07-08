Rails.application.routes.draw do
<<<<<<< HEAD
  get 'topics/new'

  get 'topisc/new'
=======
  get 'graves/new'
>>>>>>> 749485075a839f35ca59e2c179f6bbfd74983109

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
<<<<<<< HEAD
  resources :topics
=======
  resources :graves
>>>>>>> 749485075a839f35ca59e2c179f6bbfd74983109

end
