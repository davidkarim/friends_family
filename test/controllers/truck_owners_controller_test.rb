require 'test_helper'

class TruckOwnersControllerTest < ActionController::TestCase
  setup do
    @truck_owner = truck_owners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:truck_owners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create truck_owner" do
    assert_difference('TruckOwner.count') do
      post :create, truck_owner: { email: @truck_owner.email, name: @truck_owner.name }
    end

    assert_redirected_to truck_owner_path(assigns(:truck_owner))
  end

  test "should show truck_owner" do
    get :show, id: @truck_owner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @truck_owner
    assert_response :success
  end

  test "should update truck_owner" do
    patch :update, id: @truck_owner, truck_owner: { email: @truck_owner.email, name: @truck_owner.name }
    assert_redirected_to truck_owner_path(assigns(:truck_owner))
  end

  test "should destroy truck_owner" do
    assert_difference('TruckOwner.count', -1) do
      delete :destroy, id: @truck_owner
    end

    assert_redirected_to truck_owners_path
  end
end
