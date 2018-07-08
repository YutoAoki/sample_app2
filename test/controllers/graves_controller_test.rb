require 'test_helper'

class GravesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get graves_new_url
    assert_response :success
  end

end
