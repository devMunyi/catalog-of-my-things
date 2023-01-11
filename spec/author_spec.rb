require './Game_Author/author'
require './item'

describe Author do
    it 'should be an instance of author' do
        author = Author.new('Chris', 'Oyakhilome')
        expect(author).to be_an_instance_of Author
    end
    it 'should store author to author array' do
        item = Item.new(Time.new(2000, 1, 1), archived: true)
        author = Author.new('Chris', 'Oyakhilome')
        author.add_item(item)
        expect(author.items.length).to eq(1)
    end
end