EbisuAdmin::Engine.routes.draw do
  root "articles#index"

  resources :articles do
  	member do
  	  get :publish
  	end
  end
  resources :categories
end
