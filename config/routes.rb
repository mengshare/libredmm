Rails.application.routes.draw do
  root 'application#index'
  get 'search', to: 'application#search', as: :search
end
