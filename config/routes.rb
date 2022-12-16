Rails.application.routes.draw do

  # namespace :admin do
  #   get '/' => 'admin#index'
  # end
  
  devise_for :users
  resources :notes, :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root 'admin#index'

  get 'admin' => 'admin#index'
  root "notes#index"
  # root "sessions#home"
end
