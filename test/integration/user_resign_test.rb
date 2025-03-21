require "test_helper"

class UserResignTest < ActionDispatch::IntegrationTest
  test "user can sign up, confirm email, and log in" do
    post session_path, params: { session: { email: "one@example.com", password: "P@ssW0rd" } }
    assert_redirected_to root_path
    follow_redirect!
    assert_select ".flash-notice", "Logged in"
    assert_select ".nav-item", text: "Profile"

    get new_dashboard_resignation_path
    assert_response :success
    assert_select "label", "Resign reason"

    assert_difference -> { UserResignation.count } => 1 do
      post dashboard_resignation_path, params: { dashboard_resignation: { reason: "It's hard to use", accept: true } }
    end
    assert_redirected_to root_path
    follow_redirect!
    assert_select ".flash-notice", "Resigned"
    assert_select ".nav-item", text: "Sign-up"
  end
end
