Rails.application.routes.draw do
  # 公開ページ
  root "homes#top"
  get "about", to: "homes#about"

  # ログイン前ユーザー（新規登録）
  resources :users, only: [:new, :create]

  # ログイン前ユーザー（ログイン）
  get "login",  to: "user_sessions#new",    as: :login
  post "login", to: "user_sessions#create", as: :login_create
  delete "logout", to: "user_sessions#destroy", as: :logout

  # 公開検索
  get "search", to: "search#index"

  # カテゴリ別投稿一覧
  resources :categories, only: [] do
    resources :posts, only: [:index], controller: "category_posts"
  end

  resources :sub_categories, only: [] do
    resources :posts, only: [:index], controller: "sub_category_posts"
  end

  resources :purposes, only: [:show] do
    resources :posts, only: [:index], controller: "purpose_posts"
    resources :categories, only: [:index], controller: "purpose_categories"
  end

  # ログイン後ユーザー専用
  namespace :user do
    resources :users, only: [:show, :edit, :update, :destroy]

    resources :posts do
      resources :comments, only: [:create, :destroy]
    end

    resources :relationships, only: [:create, :destroy]
  end

  # 管理者専用
  namespace :admin do
    root to: "homes#admin"

    # 管理者自身のアカウント編集
    resource :admin, only: [:edit, :update]

    # ユーザー管理
    resources :users, only: [:index, :show, :destroy]

    # 管理者投稿（管理者が投稿したもの）
    resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create]
    end

    # ユーザー投稿監視
    resources :user_posts, only: [:index, :show]

    # 管理者コメント一覧
    resources :comments, only: [:index, :show, :edit, :update, :destroy]

    # ユーザーコメント監視
    resources :user_comments, only: [:index, :show, :destroy]

    # Category を追加・削除
    resources :categories

    resources :sub_categories

    # 管理者ログイン
    get "login",  to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
  end

  # Rails 標準
  get "up" => "rails/health#show", as: :rails_health_check
end
