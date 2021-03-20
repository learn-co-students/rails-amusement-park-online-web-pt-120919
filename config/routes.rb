Rails.application.routes.draw do
  resources :users
  resources :rides
  resources :attractions

  get '/signin', to: 'sessions#new'
  post "/signin", to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'

  root 'welcome#home'
  
end
