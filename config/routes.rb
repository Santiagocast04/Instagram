Rails.application.routes.draw do
  get 'users/show'
  resources :posts do
    resources :comments
  end
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :users
  resources :likes, only: [:create, :destroy]
  root 'posts#index'
end