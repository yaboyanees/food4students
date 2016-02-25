require 'test_helper'

class OptionalsControllerTest < ActionController::TestCase
  setup do
    @optional = optionals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:optionals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create optional" do
    assert_difference('Optional.count') do
      post :create, optional: { share: @optional.share }
    end

    assert_redirected_to optional_path(assigns(:optional))
  end

  test "should show optional" do
    get :show, id: @optional
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @optional
    assert_response :success
  end

  test "should update optional" do
    patch :update, id: @optional, optional: { share: @optional.share }
    assert_redirected_to optional_path(assigns(:optional))
  end

  test "should destroy optional" do
    assert_difference('Optional.count', -1) do
      delete :destroy, id: @optional
    end

    assert_redirected_to optionals_path
  end
end
