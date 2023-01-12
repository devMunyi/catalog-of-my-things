require_relative '../MusicAlbum_Genre/music_album'

describe MusicAlbum do
  let(:music_album) { MusicAlbum.new '23-12-2022', 'Strings', true }

  describe '#new' do
    it 'music_album should be the instance of MusicAlbum' do
      expect(music_album).to be_an_instance_of(MusicAlbum)
    end

    it 'returns the correct parameters' do
      expect(music_album.publish_date).to eql('23-12-2022')
      expect(music_album.name).to eql('Strings')
      expect(music_album.on_spotify).to eql(true)
    end
  end
end
