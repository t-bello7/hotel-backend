Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  post 'authentication/login', 'authentication#login'

  namespace :api do
    namespace :v0 do
      resources :users do
        resources :hotels
        resources :bookings
      end
    end
    namespace :v3 do
      resources :bookings
    end
    namespace :v2 do
      resources :rooms do
        resources :bookings
      end
    end
    namespace :v1 do
      resources :hotels do
        resources :rooms
      end
    end
  end
end
