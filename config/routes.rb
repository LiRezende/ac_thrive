Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]
  
  namespace :backoffice do
    get 'home/index'
    get '/dashboard/index', to: 'dashboard#index'
    resources :statuses

    resources :users do
      get '/delete', to: 'users#destroy'
    
      resources :people
      resources :adresses
      resources :documents
      resources :teachers
      resources :schedules
      resources :students
      resources :financial_responsibles
      resources :questions

      get 'search', to: 'search#users'
    end

    resources :profile
    resources :idioms
    resources :idiom_levels
    resources :companies
  end

  namespace :site do
    get 'home/index'
  end

  root to: 'site/home#index'
end
