require_relative './Book_Label/book'
require_relative './Book_Label/label'
require_relative './Game_Author/game'
require_relative './Game_Author/author'
require_relative './MusicAlbum_Genre/music_album'
require_relative './MusicAlbum_Genre/genre'
require_relative './storage'

class App
  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
    @genres = []
    @music_albums = []

    @storage = Storage.new(self)
  end

  def exit_app
    @storage.write_data
    puts 'Thank You for Using Our Application'
  end

  def run
    puts 'Welcome to Catalog of My Thing'
    puts 'Select an Option:
      1) List all books
      2) List all music albums
      3) List of games
      4) List all genres (e.g \'Comedy\', \'Thriller\')
      5) List all labels (e.g. \'Gift\', \'New\')
      6) List all authors (e.g. \'Stephen King\')
      7) Add a book
      8) Add a music album
      9) Add a game
      10) Exit'

    print 'Option: '
    selected_option = gets.chomp.to_i

    # handle exit case
    return exit_app if selected_option == 10

    handle_option(selected_option)
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/CyclomaticComplexity
  def handle_option(option)
    case option
    when 1
      list_books
    when 2
      list_music_albums
    when 3
      list_games
    when 4
      list_genres
    when 5
      list_labels
    when 6
      list_authors
    when 7
      add_book
    when 8
      add_music_album
    when 9
      add_game
    else
      puts 'Invalid Choice! Try again'
    end

    run
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity

  def list_books
    puts 'to be implemented by Samuel'
  end

  def list_labels
    puts 'to be implemented by Samuel'
  end

  def add_book
    puts 'to be implemented by Samuel'
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'Sorry, there is not any Music Album in the list.'
    else
      # rubocop:disable Layout/LineLength
      @music_albums.each_with_index do |album, i|
        puts "#{i + 1}- Name: #{album.name}, on_Spotify: #{album.on_spotify}, Genre: #{album.genre.name}, Publish_Date: #{album.publish_date}"
      end
      # rubocop:enable Layout/LineLength
    end
  end

  def list_genres
    if @genres.empty?
      puts 'Sorry, there is not any Genre in the list.'
    else
      @genres.each_with_index do |genre, i|
        puts "#{i + 1}- Genre: #{genre.name}"
      end
    end
  end

  def add_music_album
    print 'Album Name: '
    name = gets.chomp
    print 'Publish date: '
    publish_date = gets.chomp
    print 'Is this album on spotify?'
    on_spotify = gets.chomp
    on_spotify = %w[Y y YES yes].include?(on_spotify)
    print 'Genre of the Album: '
    genre = Genre.new(gets.chomp)
    each_album = MusicAlbum.new(publish_date, name, on_spotify)
    each_album.genre = genre
    @genres.push(genre)
    @music_albums.push(each_album)
    puts 'Music Album added successfully'
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
