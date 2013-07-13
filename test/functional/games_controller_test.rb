require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get level" do
    get :level
    assert_response :success
  end

  test "should get score" do
    get :score
    assert_response :success
  end

end
