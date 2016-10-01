require 'test_helper'

class GuestsControllerTest < ActionController::TestCase
  setup do
    @guest = guests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guest" do
    assert_difference('Guest.count') do
      post :create, guest: { city: @guest.city, country: @guest.country, email: @guest.email, first_name: @guest.first_name, invite_sent: @guest.invite_sent, last_name: @guest.last_name, phone_number: @guest.phone_number, state: @guest.state, status: @guest.status, std_sent: @guest.std_sent, street_address: @guest.street_address, zip_code: @guest.zip_code }
    end

    assert_redirected_to guest_path(assigns(:guest))
  end

  test "should show guest" do
    get :show, id: @guest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guest
    assert_response :success
  end

  test "should update guest" do
    patch :update, id: @guest, guest: { city: @guest.city, country: @guest.country, email: @guest.email, first_name: @guest.first_name, invite_sent: @guest.invite_sent, last_name: @guest.last_name, phone_number: @guest.phone_number, state: @guest.state, status: @guest.status, std_sent: @guest.std_sent, street_address: @guest.street_address, zip_code: @guest.zip_code }
    assert_redirected_to guest_path(assigns(:guest))
  end

  test "should destroy guest" do
    assert_difference('Guest.count', -1) do
      delete :destroy, id: @guest
    end

    assert_redirected_to guests_path
  end
end
