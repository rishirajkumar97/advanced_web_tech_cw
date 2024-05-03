class StocksController < ApplicationController
    require 'httparty'
  
    def index
      response = HTTParty.get('https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=WXVT1MC2X617DPMV')
      @data = response.parsed_response if response.code == 200
      render json: @data
    end
  end