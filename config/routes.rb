Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs' 

  devise_for :users

  namespace :api do
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
