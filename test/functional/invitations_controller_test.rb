require 'test_helper'

class InvitationsControllerTest < ActionController::TestCase
  test "should get accept" do
    get :accept
    assert_response :success
  end

  test "should get ignore" do
    get :ignore
    assert_response :success
  end

end
