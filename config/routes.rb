Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  get '/categories', to: 'categories#index'

# get items by category
  get '/items_by_category/:categoryId', to: 'items#items_by_category'

  post '/categories', to: 'categories#create'

  post '/items', to: 'items#create'

end
