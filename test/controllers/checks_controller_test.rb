require 'test_helper'

class ChecksControllerTest < ActionController::TestCase
  setup do
    @check = checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create check" do
    assert_difference('Check.count') do
      post :create, check: { day_of_month: @check.day_of_month, day_of_week: @check.day_of_week, hour: @check.hour, immediate: @check.immediate, minute: @check.minute, month: @check.month, name: @check.name, start_date: @check.start_date, url: @check.url }
    end

    assert_redirected_to check_path(assigns(:check))
  end

  test "should show check" do
    get :show, id: @check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @check
    assert_response :success
  end

  test "should update check" do
    patch :update, id: @check, check: { day_of_month: @check.day_of_month, day_of_week: @check.day_of_week, hour: @check.hour, immediate: @check.immediate, minute: @check.minute, month: @check.month, name: @check.name, start_date: @check.start_date, url: @check.url }
    assert_redirected_to check_path(assigns(:check))
  end

  test "should destroy check" do
    assert_difference('Check.count', -1) do
      delete :destroy, id: @check
    end

    assert_redirected_to checks_path
  end
end
