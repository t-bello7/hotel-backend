Rails.application.routes.draw do
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
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
