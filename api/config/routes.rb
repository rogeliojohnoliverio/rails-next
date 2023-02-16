# frozen_string_literal: true

Rails.application.routes.draw do
  resources :sessions
  resources :posts
  resources :users
  post 'users/upload_avatar'
end
