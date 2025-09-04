require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Instead of depending on seeds, create a sample record here
    @restaurant = Restaurant.create!(name: "La Picantería", rating: 5)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
    assert_select "body", /La Picantería/  # check restaurant name appears in HTML
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
    assert_select "body", /La Picantería/
  end

  test "should create restaurant" do
    assert_difference("Restaurant.count", 1) do
      post restaurants_url, params: { restaurant: { name: "New Test Place", rating: 4 } }
    end
    assert_redirected_to restaurant_url(Restaurant.last)
  end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: { restaurant: { name: "Updated", rating: 3 } }
    assert_redirected_to restaurant_url(@restaurant)
    @restaurant.reload
    assert_equal "Updated", @restaurant.name
  end

  test "should destroy restaurant" do
    assert_difference("Restaurant.count", -1) do
      delete restaurant_url(@restaurant)
    end
    assert_redirected_to restaurants_url
  end
end

