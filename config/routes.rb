Rails.application.routes.draw do

  resources :users, except: [:new]
  resources :posts
  resources :comments
  post 'posts/comments/new', to: 'comments#new'
  # resources :sessions, only: [:new, :create, :destroy]
  #  we dont need this because its below

  get 'user_signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destory'
  # get 'user_login', to: 'sessions#create'

  # get 'post/index'
  root 'posts#index'
  # get rid or change this

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
