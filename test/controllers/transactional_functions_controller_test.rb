require 'test_helper'

class TransactionalFunctionsControllerTest < ActionController::TestCase
  setup do
    @transactional_function = transactional_functions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transactional_functions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transactional_function" do
    assert_difference('TransactionalFunction.count') do
      post :create, transactional_function: { content: @transactional_function.content, det: @transactional_function.det, requirement_id: @transactional_function.requirement_id, traceability: @transactional_function.traceability, type: @transactional_function.type }
    end

    assert_redirected_to transactional_function_path(assigns(:transactional_function))
  end

  test "should show transactional_function" do
    get :show, id: @transactional_function
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transactional_function
    assert_response :success
  end

  test "should update transactional_function" do
    patch :update, id: @transactional_function, transactional_function: { content: @transactional_function.content, det: @transactional_function.det, requirement_id: @transactional_function.requirement_id, traceability: @transactional_function.traceability, type: @transactional_function.type }
    assert_redirected_to transactional_function_path(assigns(:transactional_function))
  end

  test "should destroy transactional_function" do
    assert_difference('TransactionalFunction.count', -1) do
      delete :destroy, id: @transactional_function
    end

    assert_redirected_to transactional_functions_path
  end
end
