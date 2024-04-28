class MarketNewsDataController < ApplicationController
  def index
    alpha_vantage_service = AlphaVantageService.new
    market_data = alpha_vantage_service.get_news_sentiment(params[:symbol])

    render json: market_data
  end
end
