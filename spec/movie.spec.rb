# frozen_string_literal: true

RSpec.describe Movie do  
  let(:movie) { FactoryBot.build(:movie) }
  describe '#init' do
    it 'initialize movie model' do
      expect(movie.url).not_to be_empty
    end
  end
  describe '#genre?' do
    it 'exist genre of the movie' do 
      expect(movie.genre?('Comedy')).to be_truthy
      expect { movie.genre?('nonExistentGenre') }.to raise_error(ArgumentError)
    end
  end    
end
