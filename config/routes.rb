Rails.application.routes.draw do
  get 'customer/index'
  get 'customer/new'
  get 'customer/edit'
  get 'customer/delete'
  get 'category/index'
  get 'category/new'
  get 'category/edit'
  get 'category/delete'
  get 'food/index'
  get 'food/show'
  get 'food/new'
  get 'food/edit'
  get 'food/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
