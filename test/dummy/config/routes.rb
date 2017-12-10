Rails.application.routes.draw do
  devise_for :users
  mount Ebisu::Engine => "/ebisu"
end
