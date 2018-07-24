Rails.application.routes.draw do

  
  post 'favorites/:video/create' => 'favorites#create'
  post 'favorites/:video/destroy' => 'favorites#destroy'
  get 'sessions/new'
  get '/signup' => 'users#new'
  root 'home#index'
  get '/about' => 'home#about'
  get 'youtubes/index' 
  get 'youtubes/:video' => 'youtubes#show'
  post 'youtubes/:video' => 'microposts#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :microposts,          only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
