require 'test_helper'

class MovementTest < ActiveSupport::TestCase

  def setup
    @user = users(:max)
    @movement = @user.movements.build(name:"first",desc:"first movement",zoom: "12",
                            movement_strength: "0.5", center_lat: "13", center_long: "-34")
  end

  test "should be valid" do
    assert @movement.save
  end

  test "user id should be present" do
    @movement.user_id = nil
    assert_not @movement.valid?
  end

  test "desc should be present" do
    @movement.desc=" "
    assert_not @movement.valid?
  end

  test "zoom should be present" do
    @movement.zoom= nil
    assert_not @movement.valid?
  end

  test "movement_strength should be present" do
    @movement.movement_strength= nil
    assert_not @movement.valid?
  end

  test "order should be most recent first" do
    assert_equal movements(:most_recent), Movement.first
  end

end
