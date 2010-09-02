require 'test_helper'

class KontextsControllerTest < ActionController::TestCase
  setup do
    @kontext = kontexts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kontexts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kontext" do
    assert_difference('Kontext.count') do
      post :create, :kontext => @kontext.attributes
    end

    assert_redirected_to kontext_path(assigns(:kontext))
  end

  test "should show kontext" do
    get :show, :id => @kontext.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @kontext.to_param
    assert_response :success
  end

  test "should update kontext" do
    put :update, :id => @kontext.to_param, :kontext => @kontext.attributes
    assert_redirected_to kontext_path(assigns(:kontext))
  end

  test "should destroy kontext" do
    assert_difference('Kontext.count', -1) do
      delete :destroy, :id => @kontext.to_param
    end

    assert_redirected_to kontexts_path
  end
end
