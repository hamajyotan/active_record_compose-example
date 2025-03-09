require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "valid" do
    user = users(:one)
    assert user.valid?
  end
end
