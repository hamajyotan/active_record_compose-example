require "test_helper"

class Dashboard::PasswordTest < ActiveSupport::TestCase
  test "#save to change the user's password." do
    user = users(:one)
    old_password = "P@ssW0rd"
    new_password = "TheNewP@ssW0rd!!!"
    assert user.user_credential.authenticate(old_password)

    dashboard_password = Dashboard::Password.new(user)
    assert dashboard_password.update(password: new_password, password_confirmation: new_password)
    assert user.user_credential.authenticate(new_password)
    assert_not user.user_credential.authenticate(old_password)
  end

  test "After saving, the value of UserCredential#token should change." do
    user = users(:one)
    assert_changes -> { user.user_credential.reload.token } do
      dashboard_password = Dashboard::Password.new(user)
      assert dashboard_password.update(password: "P@ssW0rd!!!!!", password_confirmation: "P@ssW0rd!!!!!")
    end
  end
end
