require "test_helper"

class SessionTest < ActiveSupport::TestCase
  test "Unable to authenticate if both email and password are not set." do
    session = Session.new(email: nil, password: nil)
    assert_not session.valid?
    assert_includes session.errors[:email], "Email can't be blank"
    assert_includes session.errors[:password], "Password can't be blank"
    assert_includes session.errors[:base], "Sign in failed"
    assert_not session.authorized_user_credential
  end

  test "Unable to authenticate if password is not set" do
    session = Session.new(email: "one@example.com", password: nil)
    assert_not session.valid?
    assert_includes session.errors[:password], "Password can't be blank"
    assert_includes session.errors[:base], "Sign in failed"
    assert_not session.authorized_user_credential
  end

  test "Unable to authenticate if email is not set" do
    session = Session.new(email: nil, password: "P@ssW0rd")
    assert_not session.valid?
    assert_includes session.errors[:email], "Email can't be blank"
    assert_includes session.errors[:base], "Sign in failed"
    assert_not session.authorized_user_credential
  end

  test "Unable to authenticate if password is incorrect" do
    session = Session.new(email: "one@example.com", password: "INVALID-PASSWORD")
    assert_not session.valid?
    assert_includes session.errors[:base], "Sign in failed"
    assert_not session.authorized_user_credential
  end

  test "Can authenticate if password is correct" do
    session = Session.new(email: "one@example.com", password: "P@ssW0rd")
    assert session.valid?
    assert session.authorized_user_credential
  end

  test "Can authenticate if email address is case-insensitive" do
    session = Session.new(email: "ONE@EXAMPLE.COM", password: "P@ssW0rd")
    assert session.valid?
    assert session.authorized_user_credential
  end
end
