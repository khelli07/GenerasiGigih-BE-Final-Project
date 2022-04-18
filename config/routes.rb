Rails.application.routes.draw do 
  resources :food do
    get 'edit', to: 'food#edit'
    get 'new', to: 'food#new'
    post 'delete', to: 'food#delete'
  end
  
  resources :category do
    get 'edit', to: 'category#edit'
    get 'new', to: 'category#new'
    post 'delete', to: 'category#delete'
  end
    
  resources :customer do
    get 'customer/edit/:id', to: 'customer#edit'
    get 'customer/new', to: 'customer#new'
    post 'customer/delete', to: 'customer#delete'
    get 'customer', to: 'customer#index'
  end

  resources :order do
    get 'new', to: 'order#new'
    post 'delete', to: 'order#delete'
  
    resources :order_detail do
      get 'edit', to: 'order_detail#edit'
      get 'new', to: 'order_detail#new'
      post 'delete', to: 'order_detail#delete'
    end
  end
  

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
