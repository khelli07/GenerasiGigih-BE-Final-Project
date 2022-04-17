Rails.application.routes.draw do
  get 'order_detail/new'
  get 'order_detail/edit'
  get 'order_detail/delete'
  get 'order/index'
  get 'order/show'
  get 'order/new'
  get 'order/edit'
  get 'order/delete'
  get 'category/index'
  get 'category/new'
  get 'category/edit'
  get 'category/delete'

  
  resources :food
  get 'food/', to: 'food#index'
  post 'food/new', to: 'food#new'

  get 'food(/:id)', to: 'food#show', :constraints => { :id => /\d*/ }
  get 'food/edit/:id', to: 'food#edit'
  post 'food/delete', to: 'food#delete'
  
  resources :customer
  get 'customer', to: 'customer#index'
  post 'customer/new', to: 'customer#new'
  
  get 'customer/edit/:id', to: 'customer#edit'
  post 'customer/delete', to: 'customer#delete'

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
