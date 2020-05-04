require './lib/match'

describe Match do
  subject(:match) { Match.new }
  subject(:player_one) { Player.new('Jerry') }
  subject(:player_two) { Player.new('Bob') }

  describe '#who_is_first' do
    it 'Pick a piece for players' do
      expect { match.who_is_first?(player_one, player_two) }.to change { player_one.piece }.from(' ').to(/[XO]/)
    end

    it 'Pick a piece for players' do
      expect { match.who_is_first?(player_one, player_two) }.to change { player_two.piece }.from(' ').to(/[XO]/)
    end
  end
end
