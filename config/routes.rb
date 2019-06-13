Rails.application.routes.draw do
  root 'home#show'

  devise_for :users

  post 'artists/import', to: 'imports#artist'

  resources :artists do
    resources :releases
  end
end
