Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/'

  namespace :api do
    namespace :v1 do
      post '/auth/login', to: 'authentication#login'       
      resources :hotels, only: [:index, :show]  do 
        resources :rooms, only: [:index, :show]  do
          resources :bookings
        end
      end
      resources :users do
        resources :hotels do
          resources :rooms do
             resources :bookings
          end
        end
      end      
    end
  end
end
