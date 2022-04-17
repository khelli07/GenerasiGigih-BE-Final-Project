Rails.application.routes.draw do 
  resources :food
  get 'food/', to: 'food#index'
  post 'food/new', to: 'food#new'

  get 'food/:id', to: 'food#show'
  get 'food/edit/:id', to: 'food#edit'
  post 'food/delete', to: 'food#delete'
  
  resources :category 
  get 'category/', to: 'category#index'
  get 'category/new', to: 'category#new'
  get 'category/edit/:id', to: 'category#edit'
  
  resources :customer
  get 'customer', to: 'customer#index'
  post 'customer/new', to: 'customer#new'
  
  get 'customer/edit/:id', to: 'customer#edit'
  post 'customer/delete', to: 'customer#delete'

  resources :order_detail 
  get 'order/:order_id/order_detail/new', to: 'order_detail#new'
  get 'order/:order_id/order_detail/edit/:id', to: 'order_detail#edit'
  patch 'order/:order_id/order_detail/:id', to: 'order_detail#update'
  post 'order/:order_id/order_detail/delete', to: 'order_detail#delete'
  
  resources :order 
  get 'order/', to: 'order#index'
  get 'order/new', to: 'order#new'
  
  get 'order/:id', to: 'order#show'
  get 'order/edit/:id', to: 'order#edit'
  get 'order/delete', to: 'order#delete'

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
