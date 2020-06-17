Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

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
