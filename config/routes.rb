Rails.application.routes.draw do
  resources :people do
    resources :adresses
  end
  devise_for :users
  resources :statuses
  namespace :backoffice do
    end
  namespace :backoffice do
    get 'dashboard/index'
    get '/users/:user_id', to: 'users#show'
  end
  namespace :site do
    get 'home/index'
  end
  get 'inicio', to: 'site/home#index'
  root to: 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
