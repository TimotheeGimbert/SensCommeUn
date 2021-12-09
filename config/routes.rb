Rails.application.routes.draw do
  
  resources :join_messages_recipients
  resources :private_messages
  resources :profiles
  resources :cities
  root "pages#index"
  get 'pages/presentation'
  get 'pages/contact'

  devise_for :user
  devise_for :admin

  devise_scope :user do
    authenticated :user do
      namespace :user do
        get 'dashboards/index', as: :authenticated_root
      end
    end
  end

  devise_scope :admin do
    authenticated :admin do
      namespace :admin do
        get 'dashboards/index', as: :authenticated_root
      end
    end
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
