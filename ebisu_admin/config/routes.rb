EbisuAdmin::Engine.routes.draw do
  root "articles#index"

  resources :articles
  resources :categories
end
