Rails.application.routes.draw do
  resources :likes
  get 'users/show'
  resources :posts do
    resources :comments
  end
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :users
  root 'posts#index'
end