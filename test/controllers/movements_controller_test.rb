require 'test_helper'

class MovementsControllerTest < ActionController::TestCase
  def setup
    @movement = movements(:save_dolphins)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Movement.count' do
      post :create, movement: { name:"first",desc:"first movement",zoom: 4, center_lat: 192.123, center_long: 123.12,
          movement_color: "#ffffff",movement_strength: 0.5 }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Movement.count' do
      delete :destroy, id: @movement
    end
    assert_redirected_to login_url
  end
end
