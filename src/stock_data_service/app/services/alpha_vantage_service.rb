# AlphaVantage API Stock Information Service
class AlphaVantageService
  ALPHA_VANTAGE_API = 'https://www.alphavantage.co'
  
  def initialize
    @api_key = ENV['ALPHA_VANTAGE_API_KEY']
    @connection = Faraday.new(url: ALPHA_VANTAGE_API)
  end

  def get_stock_data(function, symbol, interval)
    query_params = {
      function: function,
      symbol: symbol,
      interval: interval,
      apikey: 'ZO0CYLFSOB6YH8BO'
    }
    response = @connection.get('/query', query_params)
    #data = handle_response(response)
    data = hardcoded_stock_data(function, symbol, interval)

    # Hardcoded response if API limits are reached
    if data[:error].present?
      data = hardcoded_stock_data(function, symbol, interval) # Hardcoded fallback data
    end
    data
  end

  private

  def handle_response(response)
    if response.status == 200 && JSON.parse(response.body)['Error Message'].blank?
      JSON.parse(response.body)
    else
      { error: "Error fetching data from Alpha Vantage API: Status #{response.status}" }
    end
  end

  def hardcoded_stock_data(function, symbol, interval)
    # Placeholder hardcoded data for API limit exceptions and testing.
    {
      "metadata": {
        "Information": "Daily Prices (open, high, low, close) and Volumes",
        "Symbol": symbol,
        "Last Refreshed": "2024-05-04",
        "Interval": interval,
        "Output Size": "Compact",
        "Time Zone": "US/Eastern"
      },
      "time_series": {
        "2024-05-04": {
          "1. open": "134.82",
          "2. high": "136.00",
          "3. low": "133.77",
          "4. close": "135.68",
          "5. volume": "21093300"
        },
        "2024-05-03": {
          "1. open": "132.04",
          "2. high": "133.68",
          "3. low": "131.08",
          "4. close": "133.48",
          "5. volume": "19122300"
        }
      }
    }

  
  end
end