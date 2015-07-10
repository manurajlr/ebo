Rails.application.routes.draw do
  root 'users#new'
  get 'admin' => 'admin/users#new'
  namespace :admin do
   resources :users
  end
  resources :users
end
