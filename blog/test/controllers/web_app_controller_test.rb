require 'test_helper'

class WebAppControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get web_app_index_url
    assert_response :success
  end

end
