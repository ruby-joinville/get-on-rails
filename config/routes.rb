Rails.application.routes.draw do
  root 'home#show'

  devise_for :users

  post 'artists/import', to: 'imports#artist'

  resources :artists do
  	resources :releases do
  		collection do
  			post 'import', to: 'imports#artist_releases'
  		end
  	end
  end
end
