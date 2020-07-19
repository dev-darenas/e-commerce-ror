Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "dashboard#index"

  resources :dashboard, only: [:index]
  resources :option_types
  resources :properties
  resources :option_values
  resources :taxonomies do
    scope module: :taxonomies do
      resources :parent_taxon do
        scope module: :parent_taxon do
          resources :taxons
        end
      end
    end
  end

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
