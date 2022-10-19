Rails.application.routes.draw do
  get '/', to: 'residents#index'

  resources :addresses
  resources :residents
end
