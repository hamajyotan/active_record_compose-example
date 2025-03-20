require "test_helper"

class UserResignationTest < ActiveSupport::TestCase
  test "user must be present" do
    user_resignation = UserResignation.new(user: nil)
    assert_not user_resignation.valid?
    assert_includes user_resignation.errors[:user], "must exist"
  end
end
