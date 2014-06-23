Rails.application.routes.draw do
  root 'pages#index'
  get 'search', to: 'pages#search', as: :search
  resources :products, only: [:index, :show, :destroy] do
    post 'rating/:rating', to: 'product_reviews#create', as: 'rate'
    delete 'rating', to: 'product_reviews#destroy', as: 'unrate'
  end
  devise_for :users
end
