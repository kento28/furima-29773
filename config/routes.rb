Rails.application.routes.draw do
  devise_for :users
  root  "items#index"
  resources :items 
  resources :users, only: [:new, :create, :show, :destroy]
  resources :addresses, only: [:index, :create, :show]
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
