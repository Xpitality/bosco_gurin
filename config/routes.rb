Rails.application.routes.draw do

  root to: 'admin/locations#index'

  namespace :admin do
    resources :locations
    resources :events
    resources :contacts
    resources :links
    resources :notifications
    resources :users
    get 'info_snow', to: 'info_snow#show'
    root to: "locations#index"
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get 'locations', to: 'locations#index'
      get 'events', to: 'events#index'
      get 'contacts', to: 'contacts#index'
      get 'links', to: 'links#index'
      get 'notifications', to: 'notifications#index'
      get 'info_snow_feed', to: 'info_snow#feed'
    end
  end
end
