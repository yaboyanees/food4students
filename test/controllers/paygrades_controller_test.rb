require 'test_helper'

class PaygradesControllerTest < ActionController::TestCase
  setup do
    @paygrade = paygrades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paygrades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paygrade" do
    assert_difference('Paygrade.count') do
      post :create, paygrade: { pay: @paygrade.pay, rank: @paygrade.rank, year: @paygrade.year }
    end

    assert_redirected_to paygrade_path(assigns(:paygrade))
  end

  test "should show paygrade" do
    get :show, id: @paygrade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paygrade
    assert_response :success
  end

  test "should update paygrade" do
    patch :update, id: @paygrade, paygrade: { pay: @paygrade.pay, rank: @paygrade.rank, year: @paygrade.year }
    assert_redirected_to paygrade_path(assigns(:paygrade))
  end

  test "should destroy paygrade" do
    assert_difference('Paygrade.count', -1) do
      delete :destroy, id: @paygrade
    end

    assert_redirected_to paygrades_path
  end
end
