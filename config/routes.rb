Rails.application.routes.draw do
  root 'home#show'

  devise_for :users

  resources :records
end
