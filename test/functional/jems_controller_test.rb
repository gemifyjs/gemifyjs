require 'test_helper'

class JemsControllerTest < ActionController::TestCase
  setup do
    @jem = jems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jem" do
    assert_difference('Jem.count') do
      post :create, jem: { description: @jem.description, name: @jem.name }
    end

    assert_redirected_to jem_path(assigns(:jem))
  end

  test "should show jem" do
    get :show, id: @jem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jem
    assert_response :success
  end

  test "should update jem" do
    put :update, id: @jem, jem: { description: @jem.description, name: @jem.name }
    assert_redirected_to jem_path(assigns(:jem))
  end

  test "should destroy jem" do
    assert_difference('Jem.count', -1) do
      delete :destroy, id: @jem
    end

    assert_redirected_to jems_path
  end
end
