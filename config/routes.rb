Rails.application.routes.draw do

  devise_for :users, :controllers => { :sessions => 'sessions' }, :skip => :registrations
  devise_for :students, :companies, :skip => :sessions

  resources :services do
    resources :reviews, only: [ :new, :create ]
  end

  resources :users
  resources :projects
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
