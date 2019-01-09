Rails.application.routes.draw do
  devise_for :users
  root to: 'application#index'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get 'change_lang', to: 'users#change_lang'
  end

  resources :users
  get 'edit_profile', to: 'users#edit_profile', as: :edit_profile
  patch 'update_profile', to: 'users#update_profile', as: :update_profile
end
