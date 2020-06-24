Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'user/dashboard'
  root "user#dashboard"

  resources :option_types
  resources :properties
  resources :option_values

  namespace :api do
    namespace :v1 do
      resources :stores do
        scope module: :stores do
          resources :products
        end
      end
    end
  end
end
