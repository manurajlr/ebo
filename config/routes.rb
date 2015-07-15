Rails.application.routes.draw do
  devise_for :users
  root 'admin/users#index'
  namespace :admin do
   resources :users
  end
  resources :users
end
