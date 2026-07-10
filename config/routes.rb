Rails.application.routes.draw do
  get "search/index"

  # 公開ページ
  root "homes#top"
  get "about", to: "homes#about"

  # ログイン前ユーザー（新規登録）
  resources :users, only: [:new, :create]

  # ログイン前ユーザー（ログイン）
  get "login",  to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # 公開検索
  get "search", to: "search#index"

  # ログイン後ユーザー専用
  namespace :user do
    resources :users, only: [:show, :edit, :update, :destroy]

    resources :posts do
      resources :comments, only: [:create, :destroy]
    end

    resources :relationships, only: [:create, :destroy]
  end

  namespace :admin do
    root to: "homes#admin"
    resources :posts, only: [:index, :show, :destroy]

    get "login",  to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
  end

  # Rails 標準
  get "up" => "rails/health#show", as: :rails_health_check
end