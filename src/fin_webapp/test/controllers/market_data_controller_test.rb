require "test_helper"

class MarketDataControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get market_data_index_url
    assert_response :success
  end
end
