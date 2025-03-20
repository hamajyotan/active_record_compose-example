require "test_helper"

class UserCredentialTest < ActiveSupport::TestCase
  test "user must be present" do
    user_credential = UserCredential.new(user: nil)
    assert_not user_credential.valid?
    assert_includes user_credential.errors[:user], "must exist"
  end

  test "password must be present" do
    user = users(:three)
    user_credential = user.build_user_credential
    user_credential.password = nil
    assert_not user_credential.valid?
    assert_includes user_credential.errors[:password], "can't be blank"
  end

  test "password_confirmation must be same to password" do
    user = users(:three)
    user_credential = user.build_user_credential
    user_credential.password = "foo"
    user_credential.password_confirmation = "bar"
    assert_not user_credential.valid?
    assert_includes user_credential.errors[:password_confirmation], "doesn't match Password"
  end

  test "email must be present" do
    user = users(:three)
    user_credential = user.build_user_credential
    user_credential.email = nil
    assert_not user_credential.valid?
    assert_includes user_credential.errors[:email], "can't be blank"
  end

  test "email must be normalized to lowercase" do
    user = users(:three)
    user_credential = user.build_user_credential
    user_credential.email = "THREE@EXAMPLE.COM"
    assert_equal user_credential.email, "three@example.com"
  end

  test "email must be uniqueness" do
    user = users(:three)
    user_credential = user.build_user_credential
    user_credential.email = "one@example.com"
    assert_not user_credential.valid?
    assert_includes user_credential.errors[:email], "has already been taken"
  end

  test "The token must be automatically generated at the time of storage." do
    user = users(:three)
    user_credential = user.build_user_credential
    user_credential.email = "three@example.com"
    user_credential.password = "P@ssW0rd!!!!"
    user_credential.password_confirmation = "P@ssW0rd!!!!"
    assert user_credential.valid?
    assert_not_nil user_credential.token
  end

  test "#refresh_token changes the value of token" do
    user = users(:three)
    user_credential = user.build_user_credential
    user_credential.refresh_token
    original = user_credential.token
    user_credential.refresh_token
    assert_not_equal original, user_credential.token
  end
end
