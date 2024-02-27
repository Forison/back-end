# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
                                 sign_in: 'login',
                                 sign_out: 'logout',
                                 registration: 'signup'
                               },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }
  resources :jobs, only: %i[index create]
  patch '/like_job/:id', to: 'jobs#like_job'
  get '/favorite_job/:id', to: 'jobs#favorite_job'
  patch '/create_profile_picture', to: 'users#create_avatar'
  get '/get_profile_picture', to: 'users#show_avatar'
  get '/is_logged_in', to: 'users#is_logged_in'
end
