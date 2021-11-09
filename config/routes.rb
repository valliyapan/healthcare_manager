Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  resources :users
  resources :doctors
  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy"
end
