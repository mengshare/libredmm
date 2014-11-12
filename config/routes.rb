Rails.application.routes.draw do
  get 'users/toggle_proxy'

  root 'pages#index'
  get 'faq', to: 'pages#faq', as: :faq
  get 'search', to: 'pages#search', as: :search
  get 'toggle_proxy', to: 'pages#toggle_proxy', as: :toggle_proxy

  resources :products, only: [:index, :show, :destroy]

  %w(actresses codes genres makers titles).each do |endpoint|
    get "api/#{endpoint}"
  end
end
