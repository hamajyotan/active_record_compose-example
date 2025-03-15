require "test_helper"

class LoginTest < ActionDispatch::IntegrationTest
  test "login" do
    get root_path
    assert_response :success
    assert_select ".nav-item", text: "Login"
    assert_select ".nav-item", text: "Profile", count: 0

    get new_session_path
    assert_response :success
    assert_select "label", "Email"
    assert_select "label", "Password"

    post session_path, params: { session: { email: "one@example.com", password: "BadPassword!" } }
    assert_response :unprocessable_content
    assert_select ".model-base-error", "Sign in failed"

    post session_path, params: { session: { email: "one@example.com", password: "P@ssW0rd" } }
    assert_redirected_to root_path
    follow_redirect!
    assert_select ".flash-notice", "Logged in"
    assert_select ".nav-item", text: "Profile"

    delete session_path
    assert_redirected_to root_path
    follow_redirect!
    assert_select ".flash-notice", "Logged out"
    assert_select ".nav-item", text: "Profile", count: 0
  end
end
