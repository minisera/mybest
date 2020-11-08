Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end


  resource :posts,only: :index do
    get :trend_index, on: :member
  end

  resources :users,only: [:show,:edit,:update] do
    resource :relationships, only: [:create,:destroy]
    get :follows, on: :member
    get :followers, on: :member
    get :show_pick,on: :member
  end

  resources :post_c do
    resource :like_c,only: [:create,:destroy]
    resource :pick_c,only: [:create,:destroy]
  end
  
  resources :post_b do
    resource :like_b,only: [:create,:destroy]
    resource :pick_b,only: [:create,:destroy]
  end

  resources :post_g do
    resource :like_g,only: [:create,:destroy]
    resource :pick_g,only: [:create,:destroy]
  end

  resources :tags,only: [:index]
  
  root to: "posts#index"
end
