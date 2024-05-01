class ApplicationController < ActionController::API
    before_action :validate_token

    private
  
    def validate_token
      response = Faraday.get('http://meta-geography-243114.nw.r.appspot.com/validate_token') do |req| # Endpoint of the Main Service
        req.headers['Authorization'] = request.headers['Authorization']
      end
  
      # Check if the response status is 200 OK
      render json: { error: 'Unauthorized' }, status: :unauthorized unless response.status == 200
    end
end
