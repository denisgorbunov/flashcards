Rails.application.routes.draw do
  root 'home#index'
  resources :cards
  post '/check', to: 'trainers#check'
end
