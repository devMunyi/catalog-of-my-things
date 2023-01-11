require_relative './item'

class Label < Item
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    super(date)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end
end
