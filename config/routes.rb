Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  
  root to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
