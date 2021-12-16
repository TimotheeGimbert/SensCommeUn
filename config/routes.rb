Rails.application.routes.draw do
  
  resources :visitor_messages
  resources :stakeholder_requests
  resources :join_messages_recipients
  resources :private_messages
  resources :stakeholder_categories
  resources :external_stakeholders
  resources :legal_reps
  resources :activities
  resources :organizations
  resources :statuses
  resources :activity_sectors
  resources :profiles
  resources :cities
  root "pages#index"
  get 'pages/index'
  get 'pages/presentation'
  get 'pages/contact'
  get 'pages/news'

  devise_for :user, controllers: { registrations: 'user/registrations' }
  devise_for :admin

  devise_scope :user do
    authenticated :user do
      namespace :user do
        root "dashboards#index"
        get 'dashboards/index', as: :dashboards_index
      end
    end
  end

  devise_scope :admin do
    authenticated :admin do
      namespace :admin do
        root "dashboards#index"
        get 'dashboards/index', as: :authenticated_root
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
