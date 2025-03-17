require "test_helper"

class UserProfileTest < ActiveSupport::TestCase
  test "valid" do
    user = users(:three)
    user_profile = UserProfile.new(user:, name: "Carol", lang: :en)
    assert user_profile.valid?
  end

  test "Invalid if user is not set" do
    user = users(:three)
    user_profile = UserProfile.new(user:, name: "Carol", lang: :en)
    assert user_profile.valid?

    user_profile.user = nil
    assert_not user_profile.valid?
    assert_includes user_profile.errors[:user], "must exist"
  end

  test "Invalid if name is not set" do
    user = users(:three)
    user_profile = UserProfile.new(user:, name: "Carol", lang: :en)
    assert user_profile.valid?

    user_profile.name = nil
    assert_not user_profile.valid?
    assert_includes user_profile.errors[:name], "can't be blank"
  end

  test "Invalid if lang is not set" do
    user = users(:three)
    user_profile = UserProfile.new(user:, name: "Carol", lang: :en)
    assert user_profile.valid?

    user_profile.lang = nil
    assert_not user_profile.valid?
    assert_includes user_profile.errors[:lang], "can't be blank"
    assert_includes user_profile.errors[:lang], "is not included in the list"
  end

  test "Invalid if lang is set unknown locale" do
    user = users(:three)
    user_profile = UserProfile.new(user:, name: "Carol", lang: :en)
    assert user_profile.valid?

    user_profile.lang = :fr
    assert_not user_profile.valid?
    assert_includes user_profile.errors[:lang], "is not included in the list"
  end
end
