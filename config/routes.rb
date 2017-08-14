Ebisu::Engine.routes.draw do
  resources :articles, only: [:index]

  if Rails.env.development?
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
end
