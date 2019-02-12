Rails.application.routes.draw do

  root 'products#index'
  get 'products/search' => 'products#search'
  resources :products, only:[:new, :show, :create]
  resources :users, only:[:index] do
    resources :identifications, only:[:index, :create]
  end
  devise_for :users
  get 'users/profile/:id' => 'users#show'
  get 'users/logout'      => 'users#logout'
end
