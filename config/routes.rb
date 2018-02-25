Ebisu::Engine.routes.draw do
  get 'categories/show'
  get 'feed', to: 'rss#index', defaults: { format: :rss }

  mount EbisuAdmin::Engine, at: "/ebisu_admin"
  resources :articles, only: [:index, :show]
  resources :categories, only: [:show]
end
