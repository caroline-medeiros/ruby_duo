Rails.application.routes.draw do
  root to: proc { [ 200, {}, [ "API Ruby Duo is running!" ] ] }
  resources :lessons

  post "/signup", to: "users#create"
  resources :sessions, only: [ :create ]
  post "/ai/explain", to: "ai#explain"
end
