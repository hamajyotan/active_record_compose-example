require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid" do
    user = users(:one)
    assert user.valid?
  end

  test "#name delegates to UserProfile" do
    user = users(:one)
    assert_equal user.name, "MyStringA"
  end

  test "If there is no UserCredential, #name returns a string indicating that the membership has been canceled" do
    user = users(:resigned_user)
    assert_equal user.name, "Resigned user"
    I18n.with_locale(:ja) { assert_equal user.name, "退会済みユーザ" }
    I18n.with_locale(:en) { assert_equal user.name, "Resigned user" }
  end
end
