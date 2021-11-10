Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "patients/appointments", to: "appointments#index"
  get "appointments/invoice", to: "appointments#invoice", as: :invoice
  resources:patients
  resources:users
  resources:appointments
  get "/" => "home#index"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session

end
