Rails.application.routes.draw do
  root 'home#index'
  resources :cards
  resources :decks
  resources :users
  resources :user_sessions
  post '/check', to: 'trainers#check'
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
