require 'test_helper'

class MovementTest < ActiveSupport::TestCase

  def setup
    @user = users(:max)
    @movement = @user.movements.build(name:"first",desc:"first movement",zoom: 4, Address: "Oakland, NJ",
                             movement_color: "#ffffff",movement_strength: 0.5)
  end

  test "create with Address" do
    @movement = @user.movements.build()
  end

  test "should be valid" do
    assert @movement.valid?
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

  test "Address should be present" do
    @movement.Address = nil
    assert_not @movement.valid?
  end

  test "movement_color should be present" do
    @movement.movement_color= nil
    assert_not @movement.valid?
  end

  test "movement_strength should be present" do
    @movement.movement_strength= nil
    assert_not @movement.valid?
  end

  test "order should be most recent first" do
    assert_equal movements(:most_recent), Movement.first
  end

  test "Geocoder should fill in latitude and longitude" do
    @movement.save
    assert @movement.center_lat != nil
    assert @movement.center_long != nil
  end
end
