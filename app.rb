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
    puts 'to be implemented by Zuhaib'
  end

  def list_genres
    puts 'to be implemented by Zuhaib'
  end

  def add_music_album
    puts 'to be implemented by Zuhaib'
  end

  def list_games
    if File.empty?('./data_files/games.json')
      puts 'Games list is empty❌.'
    end
    file = File.open('./data_files/games.json')
    file_data = file.read
    data = JSON.parse(file_data)
    return unless data

    data.each { |hash| puts "[GAMES🎮] Multiplayer: #{hash['multiplayer']} | Last played date: #{hash['last_played_date']} Publish date: #{hash['publish_date']}" }
  end

  def list_authors
    puts 'to be implemented by Kene'
  end

  def add_game
    print "Enter 1 for multiplayer and 2 for single player: "
    multiplayer = gets.chomp
    multiplayer == 1 ? multiplayer = true: multiplayer = false
    print "Enter the last played at date: "
    last_played_at = gets.chomp
    print "Enter published date: "
    publish_date = gets.chomp
    game = Game.new(multiplayer, last_played_at, publish_date) 
    File.new('./data_files/games.json', 'w+') unless File.exist?('./data_files/games.json')
    if File.empty?('./data_files/games.json')
      games = []
    else
      data = File.read('./data_files/games.json').split
      games = JSON.parse(data.join)
      @games << games
    end
    games.push({ 'multiplayer' => game.multiplayer, 'last_played_at' => game.last_played_at,
                 'publish_date' => game.publish_date})
    File.write('./data_files/games.json', JSON.generate(games))
  end
end
