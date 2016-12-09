Rails.application.routes.draw do
  get '/', to: 'home#index'
  get 'v1/get', to: 'home#get_all'
  post 'v1/get', to: 'home#get_in_dist' # :dist :lat :lng
  post 'v1/footstep', to: 'footstep#create' # :device_id :g_lat_lng
  get 'user/', to: 'user#index'
  get 'user/:id', to: 'user#get'
end
