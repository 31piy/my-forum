require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "doesn't save without a title" do
    post = posts(:one)
    post.title = nil
    assert_not post.save
  end

  test "doesn't save without a body" do
    post = posts(:one)
    post.body = nil
    assert_not post.save
  end

  test "doesn't save without a user" do
    post = posts(:one)
    post.user = nil
    assert_not post.save
  end
end
