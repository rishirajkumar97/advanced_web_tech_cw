Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Routes for Graphs controller
  resources :graphs
  
  # Routes for Company Overviews
  resources :company_overviews, only: [:index, :show]  # Assuming you want index and show actions

  # Routes for Intraday Stock Data
  resources :intraday_stock_data, only: [:index]  # Assuming you only want an index action

end