require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "doesn't save without a name" do
    user = users(:one)
    user.name = nil
    assert_not user.save
  end

  test "doesn't save without a username" do
    user = users(:one)
    user.username = nil
    assert_not user.save
  end
end
