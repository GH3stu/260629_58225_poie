Rails.application.routes.draw do

  root "homes#top" 
  get "about", to: "homes#about" 
  
  resources :users do
    resources :relationships, only: [:create, :destroy]
  end

  resources :posts

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check

end
