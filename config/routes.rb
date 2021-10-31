Rails.application.routes.draw do
  root 'static_pages#top'
  resources :users
 
  resources :visiteds
  resources :attractions
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  
  post 'move' => 'attraction#move'
  get  'visited/:id' => 'visited#new'

  
end