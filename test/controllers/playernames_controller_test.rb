require 'test_helper'

class PlayernamesControllerTest < ActionController::TestCase
  setup do
    @playername = playernames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:playernames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create playername" do
    assert_difference('Playername.count') do
      post :create, playername: { amplua: @playername.amplua, name: @playername.name, photolink: @playername.photolink, team: @playername.team }
    end

    assert_redirected_to playername_path(assigns(:playername))
  end

  test "should show playername" do
    get :show, id: @playername
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @playername
    assert_response :success
  end

  test "should update playername" do
    patch :update, id: @playername, playername: { amplua: @playername.amplua, name: @playername.name, photolink: @playername.photolink, team: @playername.team }
    assert_redirected_to playername_path(assigns(:playername))
  end

  test "should destroy playername" do
    assert_difference('Playername.count', -1) do
      delete :destroy, id: @playername
    end

    assert_redirected_to playernames_path
  end
end
