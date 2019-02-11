Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources   :products, only:[:new, :show, :create]
  get 'users' => 'users#index'
  get 'users/profile/:id' => 'users#show'
  get 'users/logout'      => 'users#logout'
end
