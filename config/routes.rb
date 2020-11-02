Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :posts
  resources :users
  resources :post_c
  resources :post_b
  root to: "posts#index"
end
