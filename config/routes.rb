Rails.application.routes.draw do
  devise_for :users,controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "posts#about"
  
  resources :posts do
    resource :likes,only: [:create,:destroy]
    resource :picks,only: [:create,:destroy]
    resource :comments,only: [:create,:destroy]
    get :trend_index, on: :collection
    get :tag_index, on: :collection
    get :about,on: :collection
  end

  resources :books
  resources :clothes
  resources :goods

  resources :users,only: [:show,:edit,:update] do
    resource :relationships, only: [:create,:destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  
end
