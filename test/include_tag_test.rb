require 'test_helper'

class IncludeTagTest < ActionDispatch::IntegrationTest

  test "should show include tag" do
    get '/'
    assert_response :success
    assert response.body.include?("google_ad_client = 'client'")
  end

end
