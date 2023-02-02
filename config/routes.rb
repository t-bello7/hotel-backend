Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/'

  namespace :api do
    namespace :v1 do
      post '/auth/login', to: 'authentication#login'
      resources :hotels, only: %i[index show] do
        resources :rooms, only: %i[index show]
      end
      resources :users do
        resources :bookings
        resources :hotels do
          resources :rooms
        end
      end
    end
  end
end
