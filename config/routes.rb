Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users, only: show
  root to: "posts#index"
end
