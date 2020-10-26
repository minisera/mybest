Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users
  resources :post_c
  root to: "posts#index"
end
