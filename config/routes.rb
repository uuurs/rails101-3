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
  end
  root 'groups#index'
end
