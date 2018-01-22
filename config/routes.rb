Ebisu::Engine.routes.draw do
  get 'categories/show'

  mount EbisuAdmin::Engine, at: "/ebisu_admin"
  resources :articles, only: [:index, :show]
  resources :categories, only: [:show]
end
