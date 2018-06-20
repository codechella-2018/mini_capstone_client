Rails.application.routes.draw do
  get '/' => 'client/products#index'
  namespace :client do
    get '/products' => 'products#index'
    get '/products/new' => 'products#new'
    post '/products' => 'products#create'
    get '/products/:id' => 'products#show'
    get '/products/:id/edit' => 'products#edit'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'

    get '/orders/:id' => 'orders#show'
    post '/orders' => 'orders#create'

    post '/carted_products' => 'carted_products#create'
    get '/carted_products' => 'carted_products#index'
  end
  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
end