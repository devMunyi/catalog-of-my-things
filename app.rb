require_relative './Book_Label/book'
require_relative './Book_Label/label'
require_relative './Game_Author/game'
require_relative './Game_Author/author'
require_relative './MusicAlbum_Genre/music_album'
require_relative './MusicAlbum_Genre/genre'

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

  def list_authors
    if @authors.empty?
      puts 'There are no authors available, add some...'
    else
      authors_count = authors.count
      puts authors_count > 1 ? "#{authors_count} Authors Available" : "#{authors_count} Author Available "
      puts '-' * 70
      @authors.each_with_index do |author, i|
        puts "#{i + 1} - Author: #{author.first_name} #{author.last_name}"
      end
    end
  end

  def get_user_input(message)
    print message
    gets.chomp
  end

  def add_author
    first_name = get_user_input('Enter Author\'s first name: ')
    last_name = get_user_input('Enter Author\'s last name: ')
    author = Author.new(first_name, last_name)
    @authors << author
    puts 'Author created successfully'
  end

  def list_games
    if @games.empty?
      puts 'There are no games available, add some...'
    else
      games_count = games.count
      puts games_count > 1 ? "#{games_count} Games Available" : "#{games_count} Game Available "
      puts '-' * 70
      @games.each_with_index do |game, i|
        puts "#{i + 1} - Mutiplayer: #{game.multiplayer} | Last played: #{game.last_played_at}"
      end
    end
  end

  def add_game
    print 'Enter 1 for multiplayer and 2 for single player: '
    multiplayer = gets.chomp
    multiplayer = multiplayer == 1
    print 'Enter the last played at date: '
    last_played_at = gets.chomp
    print 'Enter published date: '
    publish_date = gets.chomp
    game = Game.new(multiplayer, last_played_at, publish_date)
    @games << game
    puts 'Game Added Successfully'
  end
end
