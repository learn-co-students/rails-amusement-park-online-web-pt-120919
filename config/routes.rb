Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index, :show]
  resources :attractions, only: [:new, :create, :index, :show, :edit, :update]
  post '/rides', to: 'rides#create'
  get '/signin', to: 'users#signin'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  root 'users#main'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
