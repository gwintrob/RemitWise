require 'test_helper'

class RemittancesControllerTest < ActionController::TestCase
  setup do
    @remittance = remittances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:remittances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create remittance" do
    assert_difference('Remittance.count') do
      post :create, remittance: @remittance.attributes
    end

    assert_redirected_to remittance_path(assigns(:remittance))
  end

  test "should show remittance" do
    get :show, id: @remittance.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @remittance.to_param
    assert_response :success
  end

  test "should update remittance" do
    put :update, id: @remittance.to_param, remittance: @remittance.attributes
    assert_redirected_to remittance_path(assigns(:remittance))
  end

  test "should destroy remittance" do
    assert_difference('Remittance.count', -1) do
      delete :destroy, id: @remittance.to_param
    end

    assert_redirected_to remittances_path
  end
end
