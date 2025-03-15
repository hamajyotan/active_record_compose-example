require "test_helper"

class UserRegistrationTest < ActiveSupport::TestCase
  test "email must be present" do
    user_credential = UserCredential.new(email: nil)
    assert_not user_credential.valid?
    assert_includes user_credential.errors[:email], "can't be blank"
  end
end
