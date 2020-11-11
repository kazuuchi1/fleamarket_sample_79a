require 'test_helper'

class BuyersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get buyers_new_url
    assert_response :success
  end

end
