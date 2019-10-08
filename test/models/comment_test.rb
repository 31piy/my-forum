require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "doesn't save without a user" do
    comment = comments(:one)
    comment.user = nil
    assert_not comment.save
  end

  test "doesn't save without a parent" do
    comment = comments(:one)
    comment.parent = nil
    assert_not comment.save
  end

  test "doesn't save without a body" do
    comment = comments(:one)
    comment.body = nil
    assert_not comment.save
  end

  test "post can be a parent to comment" do
    comment = comments(:one)
    comment.parent = posts(:one)
    comment.user = users(:one)
    assert comment.save
  end

  test "comment can be a parent to comment" do
    comment = comments(:one)
    parent_comment = comments(:two)
    comment.parent = parent_comment
    comment.user = users(:one)
    assert comment.save
  end
end
