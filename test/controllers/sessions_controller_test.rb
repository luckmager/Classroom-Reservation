require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    User.create(email: '0861020@hr.nl', password: 'test1324')
  end

  def teardown
    User.destroy(1)
  end

  test "should return success" do
    post api_v1_user_session_url, params: { email: '0861020@hr.nl', password: 'test1324' }
    assert_response :success
  end

  test "should return unauthorized" do
    post api_v1_user_session_url, params: { email: '0861020@hr.nl', password: 'test132' }
    assert_response 401
  end

end