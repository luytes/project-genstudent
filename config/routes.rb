Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "users/registrations" }

  # devise_for :users #, :controllers => { :sessions => 'sessions' }, :skip => :registrations
  # devise_for :students, :companies, :skip => :sessions
  resources :students

  resources :services do
    resources :reviews, only: [ :index, :new, :create ]
    resources :enquires, only: [ :new, :create ]
  end
  resources :reviews, only: [ :show, :edit, :update, :destroy ]

  resources :surveys, only: [ :new, :create, :index, :show, :destroy ]
  resources :enquires, only: [ :new, :create, :index, :show, :destroy ]

  resources :users do
    member do
      get :confirm_email
    end
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create, :destroy]
  end

  resources :studentapplications, only: [ :index, :create, :new ]

  get 'dashboard' => 'dashboards#show'

  root to: 'pages#home'

  controller :pages do
    get :privacy_policy
  end

end
