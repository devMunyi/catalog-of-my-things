require_relative '../Book_Label/label'
require_relative '../item'

RSpec.describe Label do
  let(:label) { Label.new 'Learning RSpec', 'Blue' }

  describe '#new' do
    it 'takes two parameters and return a Label object' do
      expect(label).to be_an_instance_of Label
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      expect(label.title).to eql('Learning RSpec')
    end

    it 'sets the title correctly' do
      label.title = 'Learning Ruby'
      expect(label.title).to eql('Learning Ruby')
    end
  end

  describe '#color' do
    it 'returns the correct color' do
      expect(label.color).to eql('Blue')
    end

    it 'sets color correctly' do
      label.color = 'Green'
      expect(label.color).to eql('Green')
    end
  end

  describe '#add_item' do
    it 'adds an item to items array' do
      item = Item.new('2023-01-11')
      label.add_item(item)
      expect(label.items.count).to eq(1)
    end
  end
end
