Ebisu::Engine.routes.draw do
  mount EbisuAdmin::Engine, at: "/ebisu_admin"
  resources :articles, only: [:index, :show]
end
