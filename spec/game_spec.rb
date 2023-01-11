require './Game_Author/game'

describe Game do
    it 'Should be an instance of Game' do
        author = Game.new(true, '04-12-2011', '09-10-2017')
        expect(author).to be_instance_of Game
    end
    it 'archived should be true' do
        game = Game.new(true, '04-12-2017', '09-10-2010')
        expect(game.can_be_archived?).to eq(true)
    end
end
