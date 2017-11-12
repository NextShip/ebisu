Ebisu::Engine.routes.draw do
  root 'articles#index'
  resources :articles, only: [:index, :show]

  if Rails.env.development?
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
end
