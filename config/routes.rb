Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "dashboard#index"

  resources :dashboard, only: [:index]
  resources :option_types
  resources :properties
  resources :option_values
  resources :products
  resources :variants

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
