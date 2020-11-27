Rails.application.routes.draw do

  root to: 'admin/locations#index'

  namespace :admin do
      resources :locations
      resources :events
      resources :users
      root to: "locations#index"
    end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
