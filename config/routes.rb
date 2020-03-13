Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'

  resources :users do
    resources :events, only: [:new, :create, :edit]
  end
  resources :events, except: [:new, :create, :edit]

  resources :speakers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
