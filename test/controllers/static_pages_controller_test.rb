require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get userProfile" do
    get static_pages_userProfile_url
    assert_response :success
  end

end
