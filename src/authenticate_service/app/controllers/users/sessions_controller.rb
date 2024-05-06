# frozen_string_literal: true

# Sessions controller for valdiate , logout and update password
class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  before_action :authenticate_user_using_jwt, only: [:update_password, :update_name]

  def update_password
    user = @current_user

    if user.valid_password?(params[:current_password])
      if params[:password] == params[:password_confirmation]
        if user.update(password: params[:password])
          render json: { status: 200, message: 'Password updated successfully.' }, status: :ok
        else
          render json: { status: 422, message: user.errors.full_messages.join(', ') }, status: :unprocessable_entity
        end
      else
        render json: { status: 422, message: 'New password and confirmation do not match.' },
               status: :unprocessable_entity
      end
    else
      render json: { status: 401, message: 'Current password is incorrect.' }, status: :unauthorized
    end
  end

  def update_name
    user = @current_user
    if user.update(name: params[:name])
      render json: { status: 200, message: 'User\'s Name updated successfully.' }, status: :ok
    else
      render json: { status: 422, message: 'Failed to update user name' }, status: :unprocessable_entity
    end
  end

  def validate
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last, ENV['DEVISE_JWT_SECRET_KEY']).first
      # TODO: Add EXP timing for first fallback
      @current_user = User.find_by(id: jwt_payload['sub'], jti: jwt_payload['jti'])
    end

    if @current_user
      render json: {
        status: 200,
        message: true,
        data: { user: @current_user.as_json.except('jti') }
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end

  respond_to :json

  private

  # Helper method to authenticate user via JWT
  def authenticate_user_using_jwt
    if request.headers['Authorization'].present?
      begin
        jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last, ENV['DEVISE_JWT_SECRET_KEY']).first
        @current_user = User.find_by(id: jwt_payload['sub'], jti: jwt_payload['jti'])

        render json: { status: 401, message: "Couldn't authenticate user." }, status: :unauthorized unless @current_user
      rescue JWT::DecodeError
        render json: { status: 401, message: "Couldn't authenticate user." }, status: :unauthorized
      end
    else
      render json: { status: 401, message: 'No authentication token provided.' }, status: :unauthorized
    end
  end

  def respond_with(current_user, _opts = {})
    render json: {
      status: {
        code: 200, message: 'Logged in successfully.',
        data: { 
          user: current_user.as_json.except('jti'),
          token: request.env['warden-jwt_auth.token']
        }
      }
    }, status: :ok
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last, ENV['DEVISE_JWT_SECRET_KEY']).first
      current_user = User.find(jwt_payload['sub'])
    end

    if current_user
      render json: {
        status: 200,
        message: 'Logged out successfully.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
