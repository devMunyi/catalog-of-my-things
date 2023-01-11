require_relative './app'
require_relative './storage'

class ConsoleUI
  def initialize
    @app = App.new
    @storage = Storage.new(@app)
    @storage.read_data
  end

  def run
    puts '-' * 90
    puts 'Welcome to Catalog of My Things'
    puts '-' * 90
    puts 'Please Choose an Option:
  1 - List all books
  2 - List all music albums
  3 - List of games
  4 - List all genres
  5 - List all labels
  6 - List all authors
  7 - Add a book
  8 - Add a music album
  9 - Add a game
  10 - Exit'
    puts ''
    print 'Option: '
    selected_option = gets.chomp.to_i

    # handle exit case
    return exit_app if selected_option == 10

    handle_option(selected_option)
  end

  def exit_app
    @storage.write_data
    puts 'Thank You for Using Our Application'
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/CyclomaticComplexity
  def handle_option(option)
    case option
    when 1
      @app.list_books
    when 2
      @app.list_music_albums
    when 3
      @app.list_games
    when 4
      @app.list_genres
    when 5
      @app.list_labels
    when 6
      @app.list_authors
    when 7
      @app.add_book
    when 8
      @app.add_music_album
    when 9
      @app.add_game
    else
      puts 'Invalid Choice! Try again'
    end

    run
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity
end
