# app/services/alpha_vantage_service.rb

require 'faraday'
require 'json'

class AlphaVantageService
  LIMIT=1000
  ALPHA_VANTAGE_API='https://www.alphavantage.co'
  def initialize
    @api_key = ENV['ALPHA_VANTAGE_API_KEY']
    @connection = Faraday.new(url: ALPHA_VANTAGE_API)
  end

  def get_news_sentiment(symbol, limit = LIMIT)
    response = @connection.get("/query", {
      function: 'NEWS_SENTIMENT',
      symbols: symbol,
      limit: limit,
      apikey: @api_key
    })

    handle_response(response)
  end

  private

  def handle_response(response)
    if response.status == 200
      JSON.parse(response.body)
    else
      { error: "Error fetching data from Alpha Vantage API: Status #{response.body}" }
    end
  end
end
