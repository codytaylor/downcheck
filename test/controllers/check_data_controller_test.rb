require 'test_helper'

class CheckDataControllerTest < ActionController::TestCase
  setup do
    @check_datum = check_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:check_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create check_datum" do
    assert_difference('CheckDatum.count') do
      post :create, check_datum: { check_id: @check_datum.check_id, date_checked: @check_datum.date_checked, response_time: @check_datum.response_time, status: @check_datum.status }
    end

    assert_redirected_to check_datum_path(assigns(:check_datum))
  end

  test "should show check_datum" do
    get :show, id: @check_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @check_datum
    assert_response :success
  end

  test "should update check_datum" do
    patch :update, id: @check_datum, check_datum: { check_id: @check_datum.check_id, date_checked: @check_datum.date_checked, response_time: @check_datum.response_time, status: @check_datum.status }
    assert_redirected_to check_datum_path(assigns(:check_datum))
  end

  test "should destroy check_datum" do
    assert_difference('CheckDatum.count', -1) do
      delete :destroy, id: @check_datum
    end

    assert_redirected_to check_data_path
  end
end
