Rails.application.routes.draw do
  resources :class_hours
  resources :class_days
  resources :idiom_levels
  resources :idioms
  
  devise_for :users
  resources :statuses
  namespace :backoffice do
    end
  namespace :backoffice do
    get 'home/index'
    get '/dashboard/index', to: 'dashboard#index'
    get '/dashboard/:user_id', to: 'dashboard#show'

    resources :people do
      resources :adresses
      resources :teachers
    end
  end
  namespace :site do
    get 'home/index'
  end
  get 'inicio', to: 'site/home#index'
  get 'profile', to: 'backoffice/profile#index'
  get 'profile/edit', to: 'backoffice/profile#edit'
  patch 'profile/update', to: 'backoffice/profile#update'
  root to: 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
