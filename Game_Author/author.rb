require_relative '/item.rb'
class Author < Item
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(first_name, last_name)
    super(date)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end
