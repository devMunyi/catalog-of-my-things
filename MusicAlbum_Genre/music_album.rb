require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date, :name

  def initialize(publish_date, name, on_spotify, genre)
    super(publish_date)
    @name = name
    @on_spotify = on_spotify
    @genre = genre
  end

  private

  def can_be_archived?
    super && @on_spotify == true
  end
end
