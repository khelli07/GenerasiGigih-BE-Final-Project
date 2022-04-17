Rails.application.routes.draw do
  get 'food/index'
  get 'food/show'
  get 'food/new'
  get 'food/edit'
  get 'food/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
