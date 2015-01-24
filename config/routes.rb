Rails.application.routes.draw do
  devise_for :users
  resources :products

  resource :cart, only: [ :show ] do
    post 'add', path: 'add/:id'
    get :checkout
  end

  resources :orders, only: [ :index, :show, :create ] do
    member do
      get :new_payment
      post :pay
    end
  end

  root 'products#index'
end
