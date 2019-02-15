Rails.application.routes.draw do

  root 'products#index'
  resources :products, only:[:new, :show, :create]
  resources :users, only:[:index] do
    resources :identifications, only:[:index]
    resource :identifications, only:[:update]
  end
  devise_for :users
  get 'users/profile/:id' => 'users#show'
  get 'users/logout'      => 'users#logout'
end
