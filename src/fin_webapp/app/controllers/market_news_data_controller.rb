class MarketNewsDataController < ApplicationController
  # Rescue block for throwing 400 request
  rescue_from ActionController::ParameterMissing do |exception|
    render json: { error: exception.message }, status: :bad_request
  end
  
  def index
    alpha_vantage_service = AlphaVantageService.new
    params.require(:symbol) # to ensure that the symbol is always present when querying Alpha Vantage Endpoint
    render json: alpha_vantage_service.get_news_sentiment(params[:symbol])
  end
end
