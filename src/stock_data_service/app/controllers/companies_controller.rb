class CompaniesController < ApplicationController
    require 'httparty'
  
    def index
      response = HTTParty.get('https://www.alphavantage.co/query?function=OVERVIEW&symbol=IBM&apikey=WXVT1MC2X617DPMV')
      @data = response.parsed_response if response.code == 200
      render json: @data
    end
  end