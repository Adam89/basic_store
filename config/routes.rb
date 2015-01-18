Rails.application.routes.draw do
  resources :products

  resource :cart, only: [ :show ] do
    post 'add', path: 'add/:id'
  end

  root 'products#index'
end
