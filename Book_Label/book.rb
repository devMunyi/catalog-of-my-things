require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, date, cover_state, archived: false)
    super(date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  # def self.list_books(books)

  # end

  def as_json()
    {
      publisher: @publisher,
      date: @publish_date,
      cover_state: @cover_state,
      archived: @archived
    }
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
