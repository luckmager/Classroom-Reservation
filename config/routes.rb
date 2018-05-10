Rails.application.routes.draw do
  resources :reservations
  devise_for :users
  resources :devices
  resources :options
  resources :buildings
  get "/admin/:page" => "admin#show"
  get 'buildings/index'

  root 'classrooms#index'
  resources :classrooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
