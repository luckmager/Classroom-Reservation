Rails.application.routes.draw do
  resources :reservations
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :devices
  resources :options
  resources :buildings
  get 'buildings/index'

  root 'classrooms#index'
  resources :classrooms

  namespace 'qr' do
    resources :buildings, only: [:index, :show] do
      resources :classrooms, only: [:show]
    end
  end

  namespace 'admin' do
    resources :dashboard
    resources :buildings do
      resources :classrooms do
        resources :devices
        resources :options
      end
    end
    resources :options
    resources :devices
    resources :users
  end

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
