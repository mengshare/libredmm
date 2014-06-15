require 'test_helper'

class Admin::ExceptionsControllerTest < ActionController::TestCase
  setup do
    @admin_exception = admin_exceptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_exceptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_exception" do
    assert_difference('Admin::Exception.count') do
      post :create, admin_exception: { backstraces: @admin_exception.backstraces, message: @admin_exception.message, uri: @admin_exception.uri }
    end

    assert_redirected_to admin_exception_path(assigns(:admin_exception))
  end

  test "should show admin_exception" do
    get :show, id: @admin_exception
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_exception
    assert_response :success
  end

  test "should update admin_exception" do
    patch :update, id: @admin_exception, admin_exception: { backstraces: @admin_exception.backstraces, message: @admin_exception.message, uri: @admin_exception.uri }
    assert_redirected_to admin_exception_path(assigns(:admin_exception))
  end

  test "should destroy admin_exception" do
    assert_difference('Admin::Exception.count', -1) do
      delete :destroy, id: @admin_exception
    end

    assert_redirected_to admin_exceptions_path
  end
end
