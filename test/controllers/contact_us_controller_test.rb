require 'test_helper'

class ContactUsControllerTest < ActionController::TestCase
  test "should get show_page" do
    get :show_page
    assert_response :success
  end

end
