class Restaurant
  attr_reader :name, :buffets
  def initialize(name)
    @name = name
    @buffets = []
  end

  def add_buffet(buffet)
    @buffets << buffet
  end

  def all_items_ever_with_more_than_2_quantity
    all_items = {}
    @buffets.each do |buffet|
      buffet.items.each do |item, quantity|
        if quantity > 2
          all_items[item] = {quantity: quantity, description: item.description}
        end
      end
    end
    all_items
  end
end
