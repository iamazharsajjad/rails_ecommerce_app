# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Sidekiq::Web => '/sidekiq'
  devise_for :customers, controllers: {
    registrations: 'customers/registrations'
  }
  root 'home#index'

  post 'hello', to: 'products#hello'
  # resource :profile, :only => [:edit, :update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'cart', to: 'carts#show'
  post 'carts/add'
  post 'carts/remove'

  resources :products
end
