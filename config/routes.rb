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
      resources :buildings
      resources :classrooms
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], controllers: {
          token_validations: 'overrides/token_validations',
          sessions: 'overrides/sessions'
      }
    end
  end
end
