Rails.application.routes.draw do

  root 'products#index'
  get 'products/search' => 'products#search'
  resources :p_images, only:[:destroy]
  resources :products, only:[:new, :show, :create, :destroy,:edit,:update] do
    resources :buys, only:[:index]
    resource  :buys, only:[:update]
  end
  resources :users, only:[:index] do
    resources :identifications, only:[:show,:index]
    resource  :identifications, only:[:update]
    resources  :listings, only:[:index,:show,:update]
    resources  :in_progresses, only:[:index]
    resources  :completeds, only:[:index]
    resources  :purchases, only:[:index]
    resources  :purchaseds, only:[:index]

  end
  devise_for :users
  get 'users/profile/:id' => 'users#show'
  get 'users/logout'      => 'users#logout'
  get 'users/card'        => 'users#card'
  get 'users/card/create' => 'users#paycreate'
  post 'users/pay'        => 'users#pay'
end
