# frozen_string_literal: true

require 'sidekiq/web'

class WhiteListedIps
  def self.matches?(request)
    @ips = WhiteListedIp.pluck(:source_ip)
    @ips.include?(request.remote_ip)
  end
end

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  constraints(WhiteListedIps) do
    ActiveAdmin.routes(self)
    # mount Sidekiq::Web => '/sidekiq'

    authenticate :admin_user do
      mount Sidekiq::Web, at: '/sidekiq'
    end
  end
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
