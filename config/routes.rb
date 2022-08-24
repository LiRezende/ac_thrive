Rails.application.routes.draw do
  resources :teachers
  devise_for :users
  resources :people
  namespace :backoffice do
    get 'dashboard/index'
  end
  namespace :site do
    get 'home/index'
  end
  resources :idioms
  get 'inicio', to: 'site/home#index'
  root to: 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
