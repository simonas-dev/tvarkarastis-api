Rails.application.routes.draw do
  get '/', to: 'home#index'
  post '/get', to: 'home#get_schools'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
