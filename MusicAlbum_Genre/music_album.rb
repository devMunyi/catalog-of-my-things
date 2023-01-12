require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date, :name

  def initialize(publish_date, name, on_spotify)
    super(publish_date)
    @name = name
    @on_spotify = on_spotify
  end
  
  def as_json()
    {
      id: @id,
      publish_date: @publish_date,
      name: @name,
      on_spotify: @on_spotify, genre: {
        id: genre.id,
        name: genre.name
      }
    }
  end
    
  private

  def can_be_archived?
    super && @on_spotify == true
  end
end
