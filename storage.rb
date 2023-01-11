require 'json'
require_relative './app'
require_relative './Book_Label/book'
require_relative './Book_Label/label'
require_relative './Game_Author/game'
require_relative './Game_Author/author'
require_relative './MusicAlbum_Genre/music_album'
require_relative './MusicAlbum_Genre/genre'

class Storage
  def initialize(app)
    @app = app
  end

  def read_data
    load_books
    load_labels
    load_music_albums
    load_genres
    load_games
    load_authors
  end

  def write_data
    save_books
    save_labels
    save_music_albums
    save_genres
    save_games
    save_authors
  end

  def save_books
    return if @app.books.empty?

    books = @app.books.map(&:as_json)
    File.write('./data_files/books.json', JSON.dump(books))
  end

  def load_books
    return unless File.exist?('./data_files/books.json')

    books = JSON.parse(File.read('./data_files/books.json'))
    books.each do |book|
      new_book = Book.new(book['publisher'], book['date'], book['cover_state'])
      @app.books.push(new_book)
    end
  end

  def save_labels
    return if @app.labels.empty?

    labels = @app.labels.map(&:as_json)
    File.write('./data_files/labels.json', JSON.dump(labels))
  end

  def load_labels
    targe_file = './data_files/labels.json'
    return unless File.exist?(targe_file)

    labels = JSON.parse(File.read(targe_file))
    labels.each do |label|
      new_label = Label.new(label['title'], label['color'])
      @app.labels.push(new_label)
    end
  end

  def save_music_albums
    # return if @app.books.empty?

    # books = @app.books.map(&:as_json)
    # File.write('books.json', JSON.dump(books))
  end

  def load_music_albums
    # return unless File.exist?('books.json')

    # books = JSON.parse(File.read('books.json'))
    # books.each do |book|
    #   new_book = Book.new(book['title'], book['author'])
    #   @app.books.push(new_book)
    # end
  end

  def save_genres
    # return if @app.books.empty?

    # books = @app.books.map(&:as_json)
    # File.write('books.json', JSON.dump(books))
  end

  def load_genres
    # return unless File.exist?('books.json')

    # books = JSON.parse(File.read('books.json'))
    # books.each do |book|
    #   new_book = Book.new(book['title'], book['author'])
    #   @app.books.push(new_book)
    # end
  end

  def save_games
    # return if @app.books.empty?

    # books = @app.books.map(&:as_json)
    # File.write('books.json', JSON.dump(books))
  end

  def load_games
    # return unless File.exist?('books.json')

    # books = JSON.parse(File.read('books.json'))
    # books.each do |book|
    #   new_book = Book.new(book['title'], book['author'])
    #   @app.books.push(new_book)
    # end
  end

  def save_authors
    # return if @app.books.empty?

    # books = @app.books.map(&:as_json)
    # File.write('books.json', JSON.dump(books))
  end

  def load_authors
    # return unless File.exist?('books.json')

    # books = JSON.parse(File.read('books.json'))
    # books.each do |book|
    #   new_book = Book.new(book['title'], book['author'])
    #   @app.books.push(new_book)
    # end
  end
end
