Rails.application.routes.draw do
  devise_for :users
  root to: 'application#index'
  get 'versions', to: 'users#versions'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  resources :users
  get 'edit_profile', to: 'users#edit_profile', as: :edit_profile
  patch 'update_profile', to: 'users#update_profile', as: :update_profile
end
