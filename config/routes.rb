Rails.application.routes.draw do
  get 'users/toggle_proxy'

  root 'pages#index'
  get 'faq', to: 'pages#faq', as: :faq
  get 'search', to: 'pages#search', as: :search

  resources :products, only: [:index, :show, :destroy] do
    post 'rating/:rating', to: 'product_reviews#create', as: 'rate'
    delete 'rating', to: 'product_reviews#destroy', as: 'unrate'
  end

  devise_for :users
  get 'users/toggle_proxy', to: 'users#toggle_proxy', as: 'toggle_proxy'


  resources :logs, only: [:index, :show]

  get 'api/actresses'
  get 'api/codes'
  get 'api/genres'
  get 'api/makers'
  get 'api/titles'
end
