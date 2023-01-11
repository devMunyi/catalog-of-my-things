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
    if @music_albums.empty? 
      puts "Sorry, there is not any Music Album in the list."
    else
      @music_albums.each_with_index do |album, i|
        puts "#{i + 1}- Name: #{album.name}, on_Spotify: #{album.on_spotify}, Genre: #{album.genre.name}, Publish_Date: #{album.publish_date}"
      end
    end
  end

  def list_genres
    if @genres.empty? 
      puts "Sorry, there is not any Genre in the list."
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
    if %w[Y y YES yes].include?(on_spotify)
      on_spotify = true
    else
      on_spotify = false
    end
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
