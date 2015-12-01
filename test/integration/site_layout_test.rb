require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:max)
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", users_path, false
    assert_select "a[href=?]", logout_path, false
    assert_select "a[href=?]", user_path(@user), false
    assert_select "a[href=?]", edit_user_path(@user), false
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", login_path, false
    assert_select "a[href=?]", users_path, true
    assert_select "a[href=?]", logout_path, true
    assert_select "a[href=?]", user_path(@user), true
    assert_select "a[href=?]", edit_user_path(@user), true
 end
end
