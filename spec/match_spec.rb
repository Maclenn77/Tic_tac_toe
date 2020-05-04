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

=begin
  describe '#next_turn' do
    it 'returns the player with the piece \'X\' if turn is odd' do
      expect(match.next_turn(player_one, player_two)).to eql(player_one)
    end

    it 'returns the player with the piece \'O\' if turn is even' do
      expect(match.next_turn(player_one, player_two)).to eql(player_two)
    end
  end
=end

  describe '#add_turn' do
    it 'inscrements the value of turn by 1' do
      expect { match.add_turn }.to change { match.turn }.from(0).to(1)
    end
  end
end
