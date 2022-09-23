# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#landing_page'
  get 'privacy', to: 'home#privacy'
  get 'terms', to: 'home#terms'
  resources :user, only: %i[index show]
  resources :post, only: %i[index create]
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks',
    invitations: 'users/invitations'
  }
end
