require_relative '../MusicAlbum_Genre/genre'
require_relative '../item'

describe Genre do
  let(:genre) { Genre.new 'Hiphop' }
  describe '#new' do
    it 'should be an instance of Genre' do
      expect(genre).to be_an_instance_of(Genre)
    end

    it 'should add an item' do
      item = Item.new('22-12-2022')
      genre.add_item(item)
      expect(genre.items[0]).to be_an_instance_of(Item)
    end
  end
end
