require 'test_helper'

class DataFunctionsControllerTest < ActionController::TestCase
  setup do
    @data_function = data_functions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_functions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_function" do
    assert_difference('DataFunction.count') do
      post :create, data_function: { attribute: @data_function.attribute, content: @data_function.content, requirement_id: @data_function.requirement_id, ret: @data_function.ret, type: @data_function.type }
    end

    assert_redirected_to data_function_path(assigns(:data_function))
  end

  test "should show data_function" do
    get :show, id: @data_function
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @data_function
    assert_response :success
  end

  test "should update data_function" do
    patch :update, id: @data_function, data_function: { attribute: @data_function.attribute, content: @data_function.content, requirement_id: @data_function.requirement_id, ret: @data_function.ret, type: @data_function.type }
    assert_redirected_to data_function_path(assigns(:data_function))
  end

  test "should destroy data_function" do
    assert_difference('DataFunction.count', -1) do
      delete :destroy, id: @data_function
    end

    assert_redirected_to data_functions_path
  end
end
