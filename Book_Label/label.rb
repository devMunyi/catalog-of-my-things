require_relative '../item'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
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

  def as_json()
    {
      title: @title,
      color: @color
    }
  end
end
