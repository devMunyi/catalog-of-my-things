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

  def get_user_input(message)
    print message
    gets.chomp
  end

  def add_book
    author = add_author
    label = add_label('Book')
    genre = add_genre('Book\'s')

    publisher = get_user_input('Who is the publisher?: ')
    date = get_user_input('What is the year of publication?: ')
    cover_state = get_user_input('What is Book Cover State? [good/bad]: ').downcase

    book = Book.new(publisher, date, cover_state)
    label.add_item(book)
    genre.add_item(book)
    author.add_item(book)

    @books.push(book)
    @labels.push(label)
    @genres.push(genre)
    @authors.push(author)

    puts ''
    puts "Book #{label.title} by #{author.first_name} #{author.last_name} was created successfully"
  end

  def add_genre(item_type)
    print "#{item_type} genre: "
    genre_name = gets.chomp
    Genre.new(genre_name)
  end

  def add_author
    first_name = get_user_input('Enter Author\'s first name: ')
    last_name = get_user_input('Enter Author\'s last name: ')
    Author.new(first_name, last_name)
  end

  def add_label(item_type)
    print "Title of the #{item_type}: "
    title = gets.chomp
    print "Color of the #{item_type}: "
    color = gets.chomp
    Label.new(title, color)
  end

  def list_books
    if @books.empty?
      puts 'There are no books available, add some...'
    else
      books_count = books.count
      puts books_count > 1 ? "#{books_count} Books Available" : "#{books_count} Book Available "
      puts '-' * 70
      @books.each_with_index do |book, i|
        puts "#{i + 1} - Title: #{book.label.title} | Author: #{book.author.first_name} #{book.author.last_name} | ",
             " Publisher: #{book.publisher} | Date: #{book.date} | Cover State: #{book.cover_state}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts 'There are no labels available'
    else
      labels_count = labels.count
      puts labels_count > 1 ? "#{labels_count} Labels Available" : "#{labels_count} Label Available "
      puts '-' * 70
      @labels.each_with_index do |label, i|
        puts "#{i + 1} | Title : #{label.title} | Color: #{label.color}"
      end
    end
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
