Ebisu::Engine.routes.draw do
  mount Admin::Engine, at: "/admin"
  root 'articles#index'
  resources :articles, only: [:index, :show]
end
