Rails.application.routes.draw do
  resources :product_to_trackers
  resources :trackers
  resources :products
  resources :comments
  devise_for :users
  resources :posts
  root 'home#home'
  get 'contact', to: 'home#contact'
  get 'prodSucts', to: 'products#index'
  get 'fourm', to: 'posts#index'
  get 'userposts', to: 'posts#display_user_posts'
  get 'tradingtracker', to: 'trackers#index'
  get 'about', to: 'about#index'
  get 'usercomments', to: 'comments#display_user_comments'
  post 'request_contact', to: 'home#request_contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
