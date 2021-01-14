require "minitest/autorun"
require "minitest/pride"
require './lib/buffet'
require './lib/item'


class BuffetTest < Minitest::Test
  def setup
    @buffet1 = Buffet.new("name")
  end

  def test_it_exists_and_has_attributes
    assert_equal "name", @buffet1.name
    assert_equal ({}), @buffet1.items
  end

  def test_test_it_can_add_items
    item1 = Item.new({name: "scrambled eggs", description: "kinda good kinda gross"})
    item2 = Item.new({name: "fried eggs", description: "lil better than scrambled"})
    item3 = Item.new({name: "soft boiled eggs", description: "i only want these in my ramen"})

    @buffet1.add_item(item1)
    @buffet1.add_item(item1)
    @buffet1.add_item(item2)
    @buffet1.add_item(item3)
    @buffet1.add_item(item3)
    @buffet1.add_item(item3)

    expected = {item1 => 2,
              item2 => 1,
              item3 => 3}
    # require "pry"; binding.pry
    assert_equal expected, @buffet1.items
  end
end
