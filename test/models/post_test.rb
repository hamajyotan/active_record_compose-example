require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "user must exist" do
    post = Post.new(user: nil)
    assert_not post.valid?
    assert_includes post.errors[:user], "must exist"
  end

  test "contet must be present" do
    post = Post.new(content: nil)
    assert_not post.valid?
    assert_includes post.errors[:content], "can't be blank"
  end
end
