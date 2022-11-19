Rails.application.routes.draw do
  resources :class_hours
  resources :class_days
  resources :idiom_levels
  resources :idioms
  resources :statuses

  devise_for :users
  
  namespace :backoffice do
    get 'home/index'
    get '/dashboard/index', to: 'dashboard#index'

    resources :users do
      get '/delete', to: 'users#destroy'
      
      resources :people
      resources :adresses
    end

    resources :profile
  end

  namespace :site do
    get 'home/index'
  end

  root to: 'site/home#index'
end
