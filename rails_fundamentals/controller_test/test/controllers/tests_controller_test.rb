require 'test_helper'

class TestsControllerTest < ActionController::TestCase
  test "should get hello" do
    get :hello
    assert_response :success
  end

  test "should get sayhello" do
    get :sayhello
    assert_response :success
  end

  test "should get sayhellojoe" do
    get :sayhellojoe
    assert_response :success
  end

  test "should get sayhellomichael" do
    get :sayhellomichael
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
