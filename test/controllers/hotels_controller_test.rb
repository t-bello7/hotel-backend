require "test_helper"

class HotelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotel = hotels(:one)
  end

  test "should get index" do
    get hotels_url, as: :json
    assert_response :success
  end

  test "should create hotel" do
    assert_difference("Hotel.count") do
      post hotels_url, params: { hotel: { email: @hotel.email, location: @hotel.location, name: @hotel.name, phone_number: @hotel.phone_number, user_id: @hotel.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show hotel" do
    get hotel_url(@hotel), as: :json
    assert_response :success
  end

  test "should update hotel" do
    patch hotel_url(@hotel), params: { hotel: { email: @hotel.email, location: @hotel.location, name: @hotel.name, phone_number: @hotel.phone_number, user_id: @hotel.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy hotel" do
    assert_difference("Hotel.count", -1) do
      delete hotel_url(@hotel), as: :json
    end

    assert_response :no_content
  end
end
