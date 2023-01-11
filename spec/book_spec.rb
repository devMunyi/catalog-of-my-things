require_relative '../Book_Label/book'

RSpec.describe Book do
  let(:book) { Book.new 'Macmillan', 'Ok' }

  describe '#new' do
    it 'takes two parameters and return a book object' do
      expect(book).to be_an_instance_of Book
    end
  end

  describe '#publisher' do
    it 'returns the correct publisher' do
      expect(book.publisher).to eql('Macmillan')
    end

    it 'sets the publisher correctly' do
      book.publisher = 'Apex'
      expect(book.publisher).to eql('Apex')
    end
  end

  describe '#cover_state' do
    it 'returns the correct cover state' do
      expect(book.cover_state).to eql('Ok')
    end

    it 'sets cover state correctly' do
      book.cover_state = 'bad'
      expect(book.cover_state).to eql('bad')
    end
  end
end
