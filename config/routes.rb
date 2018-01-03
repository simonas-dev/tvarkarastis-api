Rails.application.routes.draw do

  devise_for :users, skip: [:registrations, :sessions]
  as :user do
    get 'cancel', to: 'users/registrations#cancel', as: :cancel_user_registration
    get 'sign_up', to: 'users/registrations#new', as: :new_user_registration
    get 'edit', to: 'users/registrations#edit', as: :edit_user_registration
    patch 'users', to: 'users/registrations#update', as: :user_registration
    put 'users', to: 'users/registrations#update'
    delete 'users', to: 'users/registrations#destroy'
    post 'users', to: 'users/registrations#register'
    get 'sign_in', to: 'users/sessions#new', as: :new_user_session
    post 'sign_in', to: 'users/sessions#login', as: :user_session
    delete 'sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end
 
  root to: 'home#index'

  get '/search', to: 'home#index'
 
  get '/api/v1/', to: 'api#index'
  get '/api/v1/schools', to: 'api#get_all'
  post '/api/v1/schools', to: 'api#get_in_dist'

  post '/school/', to: 'school#save'
  get '/school/:id', to: 'school#index'
  get '/school/:id/hide', to: 'school#hide'
  get '/school/:id/delete', to: 'school#delete'
end
