require './lib/main'

# describe main do
#   subject(:match) { Match.new }
#   subject(:player_one) { Player.new('Jerry') }
#   subject(:player_two) { Player.new('Bob') }

  describe '#change_name' do
    it 'returns player\'s name if boolean is true' do
      player_two = Player.new('Bob')
      expect(change_name(true, player_two)).to eql('Bob')
    end

    it 'returns a string if boolean is false' do
      expect(change_name(false, player_two)).to be_an_instance_of(String)
    end
  end
