Rails.application.routes.draw do
  root 'home#index'
  resources :home, only: :index
  resources :products, only: :index
  namespace :admin do
    resources :products, except: %i[destroy update edit]
  end
end
