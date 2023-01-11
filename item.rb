class Item
  attr_reader :genre, :author, :label
  attr_accessor :date

  def initialize(date)
    @id = Random.rand(1..1000)
    @publish_date = date
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = auhtor
    author.items.push(self) unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_year = Time.new.year
    current_year - Date.parse(@publish_date).year > 10
  end
end
