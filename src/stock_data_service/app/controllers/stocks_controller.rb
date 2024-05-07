class StocksController < ApplicationController
  #before_action :validate_params

  rescue_from ActionController::ParameterMissing do |exception|
    render json: { error: exception.message }, status: :bad_request
  end

  def fetch_stock_data
    alpha_vantage_service = AlphaVantageService.new
    response_data = alpha_vantage_service.get_stock_data(params[:function], params[:symbol], params[:interval])

    if response_data[:error].present?
      render json: { error: response_data[:error] }, status: :bad_request
    else
      render json: response_data
    end
  end

  private

  #def validate_params
  #  allowed_functions = ['TIME_SERIES_INTRADAY', 'TIME_SERIES_DAILY', 'TIME_SERIES_WEEKLY', 'TIME_SERIES_MONTHLY']
  #  unless allowed_functions.include?(params[:function])
  #    render json: { error: "Invalid function parameter" }, status: :bad_request
  #  end

  #  if params[:symbol].blank? || params[:interval].blank?
  #    render json: { error: "Symbol and interval parameters cannot be blank" }, status: :bad_request
  #  else
  #    # Normal processing logic here
  #    render json: { message: "Parameters are fine!" } # Example render
  #  end
  #end
end