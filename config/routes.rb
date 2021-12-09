Rails.application.routes.draw do
  
  resources :profiles
  resources :cities
  root "pages#index"
  get 'pages/presentation'
  get 'pages/contact'

  namespace :user do
    get 'dashboards/index'
  end

  devise_for :users

  namespace :admin do
    get 'dashboard/index'
  end

  devise_for :admins
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
