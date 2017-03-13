Rails.application.routes.draw do

  resources :photos
  get 'my_lenta', to: 'home#index'
  scope :photos do
    resources :likes, only: [:new, :create, :destroy]
  end

  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end

  scope :photos do
    resources :comments, only: [:new, :create, :destroy]
  end

  root 'photos#index'

  resources :relationships,       only: [:create, :destroy]

end
