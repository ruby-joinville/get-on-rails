Rails.application.routes.draw do
  root 'home#show'

  devise_for :users

  post 'artists/import', to: 'imports#artist'

  #post 'artists/:artist_id/releases/import', to: 'imports#artist_releases'

  resources :artists do 
  	resources :releases do
  		collection do
  			post :import, to: 'imports#artist_releases'
  		end
  	end
  end

end
