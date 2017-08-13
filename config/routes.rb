Ebisu::Engine.routes.draw do
  resources :articles, only: [:index]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
