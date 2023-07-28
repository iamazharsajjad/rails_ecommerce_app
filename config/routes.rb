# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :customers, controllers: {
    registrations: 'customers/registrations'
  }
  root 'home#index'
  # resource :profile, :only => [:edit, :update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'cart', to: 'carts#show'
  post 'carts/add'
  post 'carts/remove'

  resources :products
end
