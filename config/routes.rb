Rails.application.routes.draw do

  # devise_for :admins
  devise_for :users

  get 'welcome/index'

  root 'welcome#index'

  resources :comments

  resources :orders
end
