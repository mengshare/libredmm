Rails.application.routes.draw do
  root 'pages#index'
  get 'faq', to: 'pages#faq', as: :faq

  get 'search', to: 'pages#search', as: :search
  resources :products, only: [:index, :show, :destroy] do
    post 'rating/:rating', to: 'product_reviews#create', as: 'rate'
    delete 'rating', to: 'product_reviews#destroy', as: 'unrate'
  end

  devise_for :users

  resources :logs, only: [:index, :show]

  get 'api/actresses'
end
