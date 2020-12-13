Rails.application.routes.draw do
  resources :product_to_trackers,:except => [:edit, :update, :show]
  resources :trackers, :except => [:new, :create, :edit, :update, :show, :destroy]
  resources :products, :except => [:new, :create, :edit, :update, :destroy]
  resources :comments
  devise_for :users
  resources :posts
  root 'home#home'
  get 'contact', to: 'home#contact'
  get 'products', to: 'products#index'
  get 'fourm', to: 'posts#index'
  get 'userposts', to: 'posts#display_user_posts'
  get 'tradingtracker', to: 'trackers#index'
  get 'about', to: 'about#index'
  get 'usercomments', to: 'comments#display_user_comments'
  post 'request_contact', to: 'home#request_contact'


end
