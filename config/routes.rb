Rails.application.routes.draw do
  root 'buildings#index'

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :reservations, except: :show
  resources :buildings, only: [:index, :show] do
    resources :classrooms, only: [:show]
  end

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
    resources :options, except: :show
    resources :devices, only: [:index, :edit, :update, :destroy]
    resources :users
  end

  namespace 'api' do
    namespace 'v1' do
      resources :reservations
      resources :buildings do
        resources :classrooms
      end
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], controllers: {
          token_validations: 'overrides/token_validations',
          sessions: 'overrides/sessions'
      }
    end

    namespace 'v2' do
      resources :devices, only: [:update]
    end
  end
end
