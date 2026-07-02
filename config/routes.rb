Rails.application.routes.draw do

  root "homes#top" 
  get "about", to: "homes#about" 
  
  resources :users, only: [:new, :create, :show]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check

end
