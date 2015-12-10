require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase

  def setup
    @relationship = Relationship.new(movement_id: 1, member_id: 2)
  end

  test "should be valid" do
    assert @relationship.valid?
  end

  test "should require a movment_id" do
    @relationship.movement_id = nil
    assert_not @relationship.valid?
  end

  test "should require a followed_id" do
    @relationship.member_id = nil
    assert_not @relationship.valid?
  end

end