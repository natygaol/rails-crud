require "test_helper"

class RestaurantTest < ActiveSupport::TestCase
  test "is valid with name and rating in range" do
    restaurant = Restaurant.new(name: "La Picantería", rating: 5)
    assert restaurant.valid?
  end

  test "is not valid without a name" do
    restaurant = Restaurant.new(rating: 4)
    assert_not restaurant.valid?
    assert_includes restaurant.errors[:name], "can't be blank"
  end

  test "is not valid without a rating" do
    restaurant = Restaurant.new(name: "Central")
    assert_not restaurant.valid?
    assert_includes restaurant.errors[:rating], "can't be blank"
  end

  test "is not valid with rating out of range" do
    restaurant = Restaurant.new(name: "Test", rating: 10)
    assert_not restaurant.valid?
    assert_includes restaurant.errors[:rating], "is not included in the list"
  end
end

