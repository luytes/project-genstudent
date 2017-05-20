Rails.application.routes.draw do
  get 'projects/index'

  get 'projects/show'

  get 'projects/update'

  get 'projects/edit'

  get 'projects/new'

  get 'projects/create'

  get 'projects/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
