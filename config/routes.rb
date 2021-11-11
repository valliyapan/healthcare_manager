Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "patients/appointments", to: "appointments#index"
  get "appointments/invoice", to: "appointments#invoice", as: :invoice
  get "/" => "home#index"
  get "/doctors/home" => "doctors#home"
  resources :users
  resources :doctors
  resources :appointments
  resources :patients
  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
