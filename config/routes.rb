Rails.application.routes.draw do
  resources :products
  root 'home#home'
  get 'contact', to: 'home#contact'
  get 'products', to: 'products#index'
  post 'request_contact', to: 'home#request_contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
