Rails.application.routes.draw do
  get '/', to: 'residents#index'

  resources :addresses
  resources :residents

  post '/resident/:id/status' => 'residents#switch_status', as: 'status_resident'
end
