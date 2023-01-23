require "sidekiq/web"
Rails.application.routes.draw do
  get 'home/index'
  
  Sidekiq::Web.use(Rack::Auth::Basic) do |username, password|
    username == "admin" && password == "admin"
  end

  mount(Sidekiq::Web => "/sidekiq")
  
  devise_for :users
  resources :notes, :users
  resources :articles

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'admin' => 'admin#index'
  # get 'admins' => 'admin#show'
  root "home#index"
  # root "sessions#home"
end
