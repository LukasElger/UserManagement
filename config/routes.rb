Rails.application.routes.draw do
  devise_for :users#, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'application#index'
  get "users/active", to:"users#active", as: :active_users
  post "users/active/change/:id", to:"users#toggle_active", as: :toggle_active
  post "users/admin/change/:id", to:"users#toggle_admin", as: :toggle_admin
  get "versions/:item_type(/:item_id)", to:"versions#index", as: :versions
  get "user_versions/:whodunnit", to:"versions#user_versions", as: :user_versions

  namespace :contur do
    resources :databases
    resources :servers
  end

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  resources :users
  get 'edit_profile', to: 'users#edit_profile', as: :edit_profile
  patch 'update_profile', to: 'users#update_profile', as: :update_profile
end
