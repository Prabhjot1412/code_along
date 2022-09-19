# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#landing_page'
  get 'privacy', to: 'home#privacy'
  get 'terms', to: 'home#terms'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
