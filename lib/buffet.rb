class Buffet
  attr_reader :name,
              :items
  def initialize(name)
    @name = name
    @items = Hash.new(0)
    # @items = Hash.new
    # @items = Hash.new { |hash, key| hash[key] = [] }
  end

  def add_item(item)
    @items[item] += 1
    # @items[item] = "breakfast time"
    # @items[item] << "this is my favorite"
  end
end
