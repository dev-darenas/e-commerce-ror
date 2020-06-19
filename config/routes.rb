Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'user/dashboard'
  root "user#dashboard"
  resources :option_types
  resources :properties
end
