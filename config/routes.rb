Ebisu::Engine.routes.draw do
  mount Admin::Engine, at: "/ebisu/admin"
  resources :articles, only: [:index, :show]
end
