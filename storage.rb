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

    books_json = @app.books.map(&:as_json)
    File.write('./data_files/books.json', JSON.dump(books_json))
  end

  def load_books
    target_file = './data_files/books.json'
    return unless File.exist?(target_file)

    books = JSON.parse(File.read(target_file))
    books.each do |book|
      new_book = Book.new(book['publisher'], book['date'], book['cover_state'])
      new_label = Label.new(book['label']['title'], book['label']['color'])
      new_author = Author.new(book['author']['first_name'], book['author']['last_name'])

      new_book.label = new_label
      new_book.author = new_author

      @app.books.push(new_book)
    end
  end

  def save_labels
    return if @app.labels.empty?

    labels_json = @app.labels.map(&:as_json)
    File.write('./data_files/labels.json', JSON.dump(labels_json))
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
    return if @app.music_albums.empty?

    music_albums = @app.music_albums.map(&:as_json)
    File.write('./data_files/music_albums.json', JSON.dump(music_albums))
  end

  def load_music_albums
    target_file = './data_files/music_albums.json'
    return unless File.exist?(target_file)

    music_albums = JSON.parse(File.read(target_file))
    music_albums.each do |album|
      new_album = MusicAlbum.new(album['publish_date'], album['name'], album['on_spotify'])
      new_genre = Genre.new(album['genre']['name'])

      new_album.genre = new_genre
      @app.music_albums.push(new_album)
    end
  end

  def save_genres
    return if @app.genres.empty?

    genres = @app.genres.map(&:as_json)
    File.write('./data_files/genres.json', JSON.dump(genres))
  end

  def load_genres
    target_file = './data_files/music_albums.json'
    return unless File.exist?(target_file)

    genres = JSON.parse(File.read(target_file))
    genres.each do |genre|
      new_genre = Genre.new(genre['genre']['name'])
      @app.genres.push(new_genre)
    end
  end

  def save_games
    return if @app.games.empty?

    games_json = @app.games.map(&:as_json)
    File.write('./data_files/games.json', JSON.dump(games_json))
  end

  def load_games
    return unless File.exist?('./data_files/games.json')

    games = JSON.parse(File.read('./data_files/games.json'))
    games.each do |game|
      new_game = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
      @app.games.push(new_game)
    end
  end

  def save_authors
    return if @app.authors.empty?

    authors_json = @app.authors.map(&:as_json)
    File.write('./data_files/authors.json', JSON.dump(authors_json))
  end

  def load_authors
    return unless File.exist?('./data_files/authors.json')

    authors = JSON.parse(File.read('./data_files/authors.json'))
    authors.each do |author|
      new_author = Author.new(author['first_name'], author['last_name'])
      @app.authors.push(new_author)
    end
  end
end
