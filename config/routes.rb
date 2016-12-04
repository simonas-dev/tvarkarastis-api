Rails.application.routes.draw do
  get '/', to: 'home#index'
  get 'v1/get', to: 'home#get_all'
  post 'v1/get', to: 'home#get_in_dist' # :dist :lat :lng
end
