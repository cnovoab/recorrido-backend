require 'sidekiq/web'
Rails.application.routes.draw do
  resources :alerts
  mount Sidekiq::Web => '/sidekiq'
  resources :users
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
