require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get toggle_proxy" do
    get :toggle_proxy
    assert_response :success
  end

end
