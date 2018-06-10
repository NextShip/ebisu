Ebisu::Engine.routes.draw do
  get 'categories/show'
  resources :feed, only: [:index], defaults: { format: :atom } do
    collection do
      get 'nordot', defaults: { format: :rss }
      get 'gunocy', defaults: { format: :rss }
    end
  end

  mount EbisuAdmin::Engine, at: "/ebisu_admin"
  resources :articles, only: [:index, :show]
  resources :categories, only: [:show]
end
