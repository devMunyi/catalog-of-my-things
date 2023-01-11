require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    super(date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.list_books(books)
    if books.empty?
      puts 'There are no books available, add some...'
    else
      puts "#{books.count} Available"
      books.each_with_index do |book, i|
        puts "#{i + 1} Title : #{book.label.title}",
             "   Publisher: #{book.publisher} Cover State: #{cover_state}"
      end
    end
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
