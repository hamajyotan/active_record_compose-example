require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest
  include ActionMailer::TestHelper

  test "user can sign up, confirm email, and log in" do
    assert_difference -> { UserRegistration.count } => 1 do
      assert_emails 1 do
        post user_registration_requests_path, params: { user_registration_request: { email: "foo@example.com" } }
        assert_redirected_to root_path
        follow_redirect!
        assert_select ".flash-notice", "We have sent you an email, please check it."
      end
    end
    user_registration = UserRegistration.last
    assert user_registration.present?

    mail = ActionMailer::Base.deliveries.last
    assert mail.present?
    assert_match "User registration has not yet been completed.", mail.subject
    assert_match "foo@example.com", mail.to.join
    assert_match "To continue user registration, please review the following links", mail.body.encoded
    confirmation_url = new_user_registration_confirmation_url(user_registration, token: user_registration.token)
    assert_match confirmation_url, mail.body.encoded

    get confirmation_url
    assert_response :success
    assert_select "label", "Password"
    assert_select "label", "Re-enter your new password"
    assert_select "label", "Name"
    assert_select 'input[name="token"][value=?]', user_registration.token

    assert_difference -> { User.count } => 1 do
      post user_registration_confirmation_path(user_registration), params: {
        token: user_registration.token,
        confirmation: { password: "P@ssW0rd", password_confirmation: "P@ssW0rd", name: "Alice" }
      }
      assert_redirected_to root_path
      follow_redirect!
      assert_select ".flash-notice", "Registered"
    end
  end
end
