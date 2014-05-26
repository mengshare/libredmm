Rails.application.routes.draw do
  get 'products/show'

  root 'application#index'
  get 'search', to: 'application#search', as: :search
  resources :products, only: :show
end
