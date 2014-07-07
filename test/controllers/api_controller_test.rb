require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get actresses" do
    get :actresses
    assert_response :success
  end

end
