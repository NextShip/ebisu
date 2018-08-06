Ebisu::Engine.routes.draw do
  get 'categories/show'
  resources :feed, only: [:index], defaults: { format: :atom } do
    collection do
      get 'nordot', defaults: { format: :rss }
      get 'gunosy', defaults: { format: :rss }
      get 'snf', defaults: { format: :rss }
    end
  end

  mount EbisuAdmin::Engine, at: "/ebisu_admin"
  resources :articles, only: [:index, :show]
  resources :categories, only: [:show]
  %w(terms privacy_policy inquiry ad_listing).each do |path|
    get "#{path}", to: "statics##{path}"
  end
end
