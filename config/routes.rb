Rails.application.routes.draw do

  root 'products#index'
  resources :products, only:[:new, :show, :create]
  resources :users, only:[:index] do
    resources :identifications, only:[:index, :create]
  end

end
