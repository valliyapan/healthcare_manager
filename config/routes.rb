Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "patients/menu", to: "patients#option", as: :option
  get "patients/list", to: "patients#list", as: :list
  get "patients/appointments", to: "appointments#index"
  get "appointments/invoice", to: "appointments#invoice", as: :invoice
  get "/" => "home#index"
  get "/doctors/home" => "doctors#home"
  get "/unseen" => "appointments#unseen"
  get "/seen" => "appointments#seen"
  get "/upcoming" => "appointments#upcoming"
  get "/blocked" => "patients#blocked"
  post "/done/:id" => "appointments#done"
  post "/unblock/:id" => "patients#unblock"
  resources :users do
    member do
      get :confirm_email
    end
  end
  resources :doctors
  resources :appointments
  resources :patients
  resources :specializations
  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
