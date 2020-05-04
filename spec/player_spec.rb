require './lib/player'

describe Player do
  subject(:player) { Player.new('Bob') }

  describe '#valid_name' do
    it 'returns true if the length of the player\'s name is greater than 0' do
      expect(player.valid_name('Jerry')).to eql(true)
    end

    it 'returns false if the length of the player\'s name is less than 1' do
      expect(player.valid_name('')).to eql(false)
    end
  end

  describe '#write_name' do
    it 'returns a string' do
      expect(player.write_name).to be_an_instance_of(String)
    end
  end
end
