# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#landing_page'
  get 'privacy', to: 'home#privacy'
  get 'terms', to: 'home#terms'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    conformations: 'users/conformations'
  }
end
