Rails.application.routes.draw do
  root 'pages#index'
  get 'search', to: 'pages#search', as: :search
  resources :products, only: [:show, :destroy] do
    post 'rating/:rating', to: 'product_reviews#create', as: 'create_rating'
  end
  devise_for :users
end
