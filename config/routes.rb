Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/'

  post 'authentication/login', 'authentication#login'

  namespace :api do
    namespace :v1 do
      resources :rooms do
        resources :bookings
      end
      resources :users do
        resources :hotels
        resources :bookings
      end
      resources :hotels do
        resources :rooms
      end
      resources :bookings
      resources :sessions, only: %i[create destroy]
    end
  end
end
