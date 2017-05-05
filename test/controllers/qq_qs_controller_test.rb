require 'test_helper'

class QqQsControllerTest < ActionController::TestCase
  setup do
    @qqq = qqqs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qqqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qqq" do
    assert_difference('Qqq.count') do
      post :create, qqq: { qq: @qqq.qq }
    end

    assert_redirected_to qqq_path(assigns(:qqq))
  end

  test "should show qqq" do
    get :show, id: @qqq
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qqq
    assert_response :success
  end

  test "should update qqq" do
    patch :update, id: @qqq, qqq: { qq: @qqq.qq }
    assert_redirected_to qqq_path(assigns(:qqq))
  end

  test "should destroy qqq" do
    assert_difference('Qqq.count', -1) do
      delete :destroy, id: @qqq
    end

    assert_redirected_to qqqs_path
  end
end
