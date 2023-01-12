require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state, :label, :author, :date

  def initialize(publisher, date, cover_state, archived: false)
    super(date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
    @date = date
  end

  def as_json()
    {
      id: @id,
      publisher: @publisher,
      date: @date,
      cover_state: @cover_state,
      archived: @archived, label: {
        id: label.id,
        title: label.title,
        color: label.color
      }, author: {
        id: author.id,
        first_name: author.first_name,
        last_name: author.last_name
      }
    }
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
