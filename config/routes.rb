Rails.application.routes.draw do

  get 'page/index'

  resources :organizations
  resources :users, except: [:new]
  resources :posts
  resources :comments, except: [:new]
  post 'posts/comments/new', to: 'comments#new'

  get 'user_signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destory'

  root 'page#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
