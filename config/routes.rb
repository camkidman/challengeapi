require 'api_constraints'
Rails.application.routes.draw do

  devise_for :users
  namespace :api, { format: :json, constraints: { subdomain: 'api' }, path: '/'}  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, only: [:show, :create, :update, :destroy] do
        resources :challenges, only: [:create]
      end
      resources :challenges, only: [:show, :index]
    end
  end
end
