# frozen_string_literal: true

# Application Controller to have before or after action blocks
class ApplicationController < ActionController::API
    require 'faraday'
    require 'faraday_middleware'

    #before_action :validate_token
  
    private
  
    #def validate_token
    #  token = request.headers['Authorization']
    #  conn = Faraday.new(url: 'https://meta-geography-243114.nw.r.appspot.com') do |faraday|
    #    faraday.request :url_encoded # form-encode POST params
    #    faraday.response :logger                 # log requests to STDOUT
    #    faraday.adapter Faraday.default_adapter  # make requests with Net::HTTP
    #    faraday.use FaradayMiddleware::FollowRedirects, limit: 3 # follow redirects up to a limit
    #    faraday.headers['Authorization'] = token
    #  end
  
  #    response = conn.get('/validate_token')
  
      # Check if the response status is 200 OK
   #   unless response.status == 200
     #   Rails.logger.info("invalid attempt with bearer token: #{token}")
    #    render json: { error: 'Unauthorized' }, status: :unauthorized
     # end
  
      #true
   # end
  end