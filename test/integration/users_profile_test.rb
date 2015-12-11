require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  def setup
    @user = users(:max)
    @user2 = users(:archer)
  end

  test "users can only start movements from thier own page" do

  end



end