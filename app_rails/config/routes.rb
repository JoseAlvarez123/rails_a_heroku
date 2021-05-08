# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  resources :users do
    resources :publications, only: :create
    resources :messages, only: :create
    resources :reviews, only: :create
  end

  resources :publications do
    resources :user_requests, only: :create
  end

  resources :user_requests do
    resources :users, only: :show
  end

  resources :comments

  resources :messages

  resources :reviews

  root 'publications#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
