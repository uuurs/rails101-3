Rails.application.routes.draw do
  devise_for :users
  # For details on
  resources :groups do
    resources :posts
  end
  root 'groups#index'
end
