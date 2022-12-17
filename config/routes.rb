Rails.application.routes.draw do
  
  devise_for :users
  resources :notes, :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'admin' => 'admin#index'
  root "notes#index"
  # root "sessions#home"
end
