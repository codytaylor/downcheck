require 'test_helper'

class AboutUsControllerTest < ActionController::TestCase
  test "should get show_page" do
    get :show_page
    assert_response :success
  end

end
