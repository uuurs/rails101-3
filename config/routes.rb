Rails.application.routes.draw do
  devise_for :users
  # For details on
  resources :groups do
    member do
      post :join
      post :quit
    end
    resources :posts
  end

  namespace :account do
    resources :groups
    resources :posts
  end
  root 'groups#index'
end
