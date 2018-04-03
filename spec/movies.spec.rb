# frozen_string_literal: true

RSpec.describe MoviesCollection do  
  let(:movies) { FactoryBot.build(:movies_collection) }
  describe '#all' do
    it 'return all movies' do
      expect(movies.all).not_to be_empty
    end
  end
  describe '#filter' do
    it 'filtered by Comedy genre' do
      expect(movies.filter(genre: 'Comedy').length).to eql(2)
    end
  end
  describe '#sort_by' do
    it 'sort by year' do
      expect(movies.sort_by(:year).first.year).to eql('1948')
    end
  end
  describe '#stats' do
    it 'stats by producer' do
      expect(movies.stats(:producer)).to eql(
        'Billy Wilder' => 3,
        'Robert Mulligan' => 1,
        'John Huston' => 1
      )
    end
  end
end
