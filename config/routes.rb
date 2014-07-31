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

  %w(actresses codes genres makers titles).each do |endpoint|
    get "api/#{endpoint}"
  end
end
