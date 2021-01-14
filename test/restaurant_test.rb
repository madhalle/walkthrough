require "minitest/autorun"
require "minitest/pride"
require './lib/buffet'
require './lib/item'
require './lib/restaurant'

class RestaurantTest < Minitest::Test
  def setup
    @restaurant = Restaurant.new("breakfast galore")
    @buffet1 = Buffet.new("only eggs")
    @buffet2 = Buffet.new("smoothies")
    @buffet3 = Buffet.new("bread")

    @item1 = Item.new({name: "scrambled eggs", description: "kinda good kinda gross"})
    @item2 = Item.new({name: "fried eggs", description: "lil better than scrambled"})
    @item3 = Item.new({name: "soft boiled eggs", description: "i only want these in my ramen"})

    @item4 = Item.new({name: "chocolate croissant", description: "i only want these"})

    @item5 = Item.new({name: "fruit smoothie", description: "banana strawberry"})
    # item4 = Item.new({name: "chocolate croissant", description: "i only want these"})

    @buffet1.add_item(@item1)
    @buffet1.add_item(@item1)
    @buffet1.add_item(@item2)
    @buffet1.add_item(@item3)
    @buffet1.add_item(@item3)
    @buffet1.add_item(@item3)

    @buffet2.add_item(@item4)

    @buffet3.add_item(@item5)
    @buffet3.add_item(@item5)
  end

  def test_the_good_stuff
    assert_equal "breakfast galore", @restaurant.name
    assert_equal [], @restaurant.buffets
  end

  def test_add_buffet
    @restaurant.add_buffet(@buffet1)
    @restaurant.add_buffet(@buffet2)
    @restaurant.add_buffet(@buffet3)

    assert_equal [@buffet1, @buffet2, @buffet3], @restaurant.buffets
  end

  def test_all_items_in_restaurant
    @restaurant.add_buffet(@buffet1)
    @restaurant.add_buffet(@buffet2)
    @restaurant.add_buffet(@buffet3)

    expected = { @item1 => { quantity: 2 , description:"kinda good kinda gross" },
                  @item2 => {quantity: 1, description: "lil better than scrambled"},
                  @item3 => {quantity: 3, description: "i only want these in my ramen"},
                  @item4 => {quantity: 1, description: "i only want these"},
                  @item5 => {quantity: 2, description: "banana strawberry"}
                }

    assert_equal expected, @restaurant.all_items_ever
  end
end
