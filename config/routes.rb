Rails.application.routes.draw do
  get '/products', to: 'products#index', as: :product
  post '/products', to: 'products#create'
  patch '/products(/:id)', to: 'products#update'
  delete '/products(/:id)', to: 'products#destroy'

  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :index, :create]
    resources :sessions, only: [:new, :create]
  end
end
