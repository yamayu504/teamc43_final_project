Rails.application.routes.draw do

  root 'products#index'
  get 'products/search' => 'products#search'
  resources :products, only:[:new, :show, :create]
  resources :users, only:[:index] do
    resources :identifications, only:[:show,:index]
    resource  :identifications, only:[:update]
    resources  :listings, only:[:index]
    resources  :in_progresses, only:[:index]
    resources  :completeds, only:[:index]
    resources  :purchases, only:[:index]
    resources  :purchaseds, only:[:index]

  end
  devise_for :users
  get 'users/profile/:id' => 'users#show'
  get 'users/logout'      => 'users#logout'
end
