Rails.application.routes.draw do

  devise_for :users #, :controllers => { :sessions => 'sessions' }, :skip => :registrations
  # devise_for :students, :companies, :skip => :sessions
  resources :students

  resources :services do
    resources :reviews, only: [ :index, :new, :create ]
  end
  resources :reviews, only: [ :show, :edit, :update, :destroy ]

  resources :surveys, only: [ :new, :create ]

  resources :users

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  get 'dashboard' => 'dashboards#show'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
