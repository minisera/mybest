Rails.application.routes.draw do
  devise_for :users,controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resource :posts,only: :index do
    get :index,on: :member
    get :trend_index, on: :member
    get :about,on: :member
  end

  resources :users,only: [:show,:edit,:update] do
    resource :relationships, only: [:create,:destroy]
    get :follows, on: :member
    get :followers, on: :member
    get :show_pick,on: :member
  end

  resources :post_cs do
    resource :like_cs,only: [:create,:destroy]
    resource :pick_cs,only: [:create,:destroy]
    resource :comment_cs,only: [:create,:destroy]
  end
  
  resources :post_bs do
    resource :like_bs,only: [:create,:destroy]
    resource :pick_bs,only: [:create,:destroy]
    resource :comment_bs,only: [:create,:destroy]
  end
  
  resources :post_gs do
    resource :like_gs,only: [:create,:destroy]
    resource :pick_gs,only: [:create,:destroy]
    resource :comment_gs,only: [:create,:destroy]
  end

  resources :tags,only: [:index]
  
  root to: "posts#about"
end
