Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles

  ## the (#) here is used for the user controller and new action
  get 'signup', to: 'users#new'

  ## creating a path for the user 1 of 2 ways post alone or with the resource
  post 'users', to: 'users#create'

  resources :users, except: [:new] ## basically says you want all the routes except the new ones

  ## This is linked to the controllers/sessions_controller.rb file
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
