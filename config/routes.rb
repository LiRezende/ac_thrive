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
      resources :adresses
      resources :people
    end
  end

  namespace :site do
    get 'home/index'
  end

  root to: 'site/home#index'
end
