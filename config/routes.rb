require 'sidekiq/web'
Rails.application.routes.draw do
  resources :alerts do
    resources :lookups, only: :index
    get 'lookups/latest/bustravels' => 'bustravels#index'
  end
  resources :lookups, only: :show
  mount Sidekiq::Web => '/sidekiq'
  resources :users
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
