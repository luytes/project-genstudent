Rails.application.routes.draw do

  devise_for :users
  devise_for :company
  devise_for :students

  resources :services
  resources :users
  resources :projects
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
