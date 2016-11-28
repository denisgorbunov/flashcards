Rails.application.routes.draw do
  root 'home#index'
  get 'cards', to: 'card#index'
  resource :card
end
