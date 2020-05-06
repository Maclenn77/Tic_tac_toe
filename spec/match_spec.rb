require_relative '../lib/match'

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

  describe '#next_turn' do
    it 'returns the player with the piece \'X\' if turn is odd' do
      match.add_turn
      player_one.piece = 'X'
      player_two.piece = 'O'
      expect(match.next_turn(player_one, player_two)).to eql(player_one)
    end

    it 'returns the player with the piece \'O\' if turn is even' do
      match.add_turn
      match.add_turn
      player_one.piece = 'X'
      player_two.piece = 'O'
      expect(match.next_turn(player_one, player_two)).to eql(player_two)
    end
  end

  describe '#add_turn' do
    it 'inscrements the value of turn by 1' do
      expect { match.add_turn }.to change { match.turn }.from(0).to(1)
    end
  end

  describe '#place_move' do
    it 'changes the hash with player\'s piece' do
      expect { match.place_move(1, player_one) }.to change { match.hash[1] }.from(1).to(player_one.piece)
    end
  end

  describe '#check_winner' do
    it 'doesn\'t return true if there\'s isn\'t a winner' do
      match.place_move(1, player_two)
      match.place_move(2, player_one)
      match.place_move(9, player_two)
      match.place_move(4, player_one)
      expect(match.check_winner(player_one)).not_to eql(true)
    end

    it 'returns true when there\'s a winner' do
      match.place_move(1, player_one)
      match.place_move(4, player_one)
      match.place_move(7, player_one)
      expect(match.check_winner(player_one)).to eql(true)
    end
  end

  describe '#total_score' do
    it 'returns the score' do
      expect(match.total_score(player_one, player_two, :matches)).to be_an_instance_of(String)
    end
  end
end
