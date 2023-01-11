require_relative '../item'

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

  def add_item(item)
    @items << item
    item.label = self
  end

  def self.list_labels(labels)
    if labels.empty?
      puts 'There are no labels, add some...'
    else
      puts "#{labels.count} Labels Available"
      labels.each_with_index do |label, i|
        puts "#{i + 1} Title: #{label.title} Color: #{label.color}"
      end
    end
  end
end
