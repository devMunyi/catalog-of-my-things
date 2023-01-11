require_relative './Book_Label/book'
require_relative './Book_Label/label'
require_relative './Game_Author/game'
require_relative './Game_Author/author'
require_relative './MusicAlbum_Genre/music_album'
require_relative './MusicAlbum_Genre/genre'
require_relative './storage'

class App
  attr_accessor :books, :labels, :games, :authors, :genres, :music_albums

  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
    @genres = []
    @music_albums = []
  end

  def get_user_input(message)
    print message
    gets.chomp
  end

  def add_book
    publisher = get_user_input('Enter Book Title: ')
    date = get_user_input('Enter Year of Publication: ')
    cover_state = get_user_input('Enter Book Cover State [good/bad]: ')

    @books.push(Book.new(publisher, date, cover_state))
    puts 'Book created successfully'
  end

  def list_books
    if @books.empty?
      puts 'There are no books available, add some...'
    else
      p books
      books_count = books.count
      puts books_count > 1 ? "#{books_count} books Available" : "#{books_count} book Available "
      puts '-' * 70
      @books.each_with_index do |book, i|
        puts "#{i + 1} | Publisher: #{book.publisher} | Date: #{book.publish_date} | Cover State: #{book.cover_state}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts 'There are no labels available'
    else
      puts "#{@labels.count} Available"
      @labels.each_with_index do |label, i|
        puts "#{i + 1} Title : #{label.title}",
             "   Publisher: #{label.color}"
      end
    end
  end

  def list_music_albums
    puts 'to be implemented by Zuhaib'
  end

  def list_genres
    puts 'to be implemented by Zuhaib'
  end

  def add_music_album
    puts 'to be implemented by Zuhaib'
  end

  def list_games
    puts 'to be implemented by Kene'
  end

  def list_authors
    puts 'to be implemented by Kene'
  end

  def add_game
    puts 'to be implemented by Kene'
  end
end
