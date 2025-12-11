Rails.application.routes.draw do
  resources :lessons

  post "/signup", to: "users#create"
  post "/login", to: "auth#login"
end
