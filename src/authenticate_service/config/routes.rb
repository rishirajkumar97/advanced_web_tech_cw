Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check
  devise_for :users, path: '', path_names: {
                                 sign_in: 'login',
                                 sign_out: 'logout',
                                 registration: 'signup'
                               },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }

  # Route for Validate Token
  devise_scope :user do
    get '/validate_token', to: 'users/sessions#validate'
    put '/update_password', to: 'users/sessions#update_password'
    put '/update_name', to: 'users/sessions#update_name'
  end
end
