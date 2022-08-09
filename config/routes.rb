Rails.application.routes.draw do
  namespace :site do
    get 'home/index'
  end
  resources :idioms
  devise_for :users
  get 'inicio', to: 'site/home#index'
  root to: 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
