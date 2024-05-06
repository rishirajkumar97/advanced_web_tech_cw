Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Route for Company Overviews
  get 'companies/data', to: 'companies#fetch_company_data', as: :fetch_company_data

  # Route for AlphaVantage Stock Data
  get 'stocks/data', to: 'stocks#fetch_stock_data', as: :fetch_stock_data

end