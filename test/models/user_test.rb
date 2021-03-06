require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'example user', email: 'user@example.com', password: 'foobar', password_confirmation: 'foobar')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = '    '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '     '
    assert_not @user.valid?
  end

  test 'email too long' do
    @user.email = 'a'* 250 + '@google.com'
    assert_not @user.valid?
  end

  test 'name too long' do
    @user.name = 'a' *51
    assert_not @user.valid?
  end

  test 'valid email address test' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]

    valid_addresses.each do |valid_address|
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'invalid email addresses' do
    invalid_addresses = %w[user@example,come user_at_foo.org user.name@example. foo@bar_baz.com for@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user =@user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'password should be non-empty' do
    @user.password = @user.password_confirmation = ' ' *6
    assert_not @user.valid?
  end

  test 'password should be at least 6 chars' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test 'passwords should match' do
    @user.password = "aabbcc"
    @user.password_confirmation = "bbaacc"
    assert_not @user.valid?
  end

  test "autheticated? with empty password" do
    assert_not @user.authenticated?(:remember,'')
  end

  test "associated movements should be destroyed" do
    @user.save
    @user.movements.create!(name: "Lorem ipsum", desc: "save dolphins", zoom: 1000, center_lat: 34, center_long: 40, movement_color: "#ffffff", movement_strength: 0.5)
        assert_difference 'Movement.count', -1 do
          @user.destroy
        end
  end

  test "movement_can_be_followed" do
    user1 = users(:max)
    user2 = users(:archer)
    movement1 = movements(:save_dolphins)
    movement2 = movements(:most_recent)
    user1.join(movement1)
    user2.join(movement2)
    assert user1.member?(movement1)
    assert user2.member?(movement2)
    assert_not user1.member?(movement2)
    user1.join(movement2)
    assert user1.member?(movement2)
    user1.destroy
    assert_not user1.member?(movement2)
  end



end
