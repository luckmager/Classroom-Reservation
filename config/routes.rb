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

  namespace 'api' do
    namespace 'v1' do
      resources :reservations
      devise_for :users
      resources :buildings
      resources :classrooms
      resources :users
    end
  end
end
