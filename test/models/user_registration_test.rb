require "test_helper"

class UserRegistrationTest < ActiveSupport::TestCase
  test "email must be present" do
    user_registration = UserCredential.new(email: nil)
    assert_not user_registration.valid?
    assert_includes user_registration.errors[:email], "Email can't be blank"
  end
end
