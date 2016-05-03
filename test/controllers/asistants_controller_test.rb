require 'test_helper'

class AsistantsControllerTest < ActionController::TestCase
  setup do
    @asistant = asistants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asistants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asistant" do
    assert_difference('Asistant.count') do
      post :create, asistant: { carer: @asistant.carer, code: @asistant.code, codeEvent: @asistant.codeEvent, name: @asistant.name }
    end

    assert_redirected_to asistant_path(assigns(:asistant))
  end

  test "should show asistant" do
    get :show, id: @asistant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asistant
    assert_response :success
  end

  test "should update asistant" do
    patch :update, id: @asistant, asistant: { carer: @asistant.carer, code: @asistant.code, codeEvent: @asistant.codeEvent, name: @asistant.name }
    assert_redirected_to asistant_path(assigns(:asistant))
  end

  test "should destroy asistant" do
    assert_difference('Asistant.count', -1) do
      delete :destroy, id: @asistant
    end

    assert_redirected_to asistants_path
  end
end
