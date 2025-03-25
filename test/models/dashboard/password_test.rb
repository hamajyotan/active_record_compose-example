require "test_helper"

class Dashboard::PasswordTest < ActiveSupport::TestCase
  test "After saving, the value of UserCredential#token should change." do
    user = users(:one)
    assert_changes -> { user.user_credential.reload.token } do
      dashboard_password = Dashboard::Password.new(user)
      assert dashboard_password.update(password: "P@ssW0rd!!!!!", password_confirmation: "P@ssW0rd!!!!!")
    end
  end
end
