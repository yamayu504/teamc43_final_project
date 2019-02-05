Rails.application.routes.draw do
  root 'products#index'
  resources   :products, only:[:new, :show, :create]
  get 'users' => 'users#index'
end
