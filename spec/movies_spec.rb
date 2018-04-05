# frozen_string_literal: true

RSpec.describe MoviesCollection do
  let!(:movies) { FactoryBot.build(:movies_collection) }
  describe '#all' do
    it 'return all movies' do
      expect(movies.all).not_to be_empty
    end
  end
  describe '#filter' do
    it 'filtered by Comedy genre' do
      expect(movies.filter(genre: 'Comedy').length).to eql(4)
    end
  end
  describe '#sort_by' do
    it 'sort by year' do
      expect(movies.sort_by(:date).last.date).to eql('2013-12-25')
    end
  end
  describe '#stats' do
    it 'stats by producer' do
      expect(movies.stats(:producer)).to eql(
        'Billy Wilder': 3,
        'Robert Mulligan': 1,
        'John Huston': 1,
        'Guy Ritchie': 1,
        'David Lynch': 1,
        'Martin Scorsese': 2,
        'Hayao Miyazaki': 1,
        "Gavin O\'Connor": 1,
        'Clint Eastwood': 1,
        'James McTeigue': 1
      )
    end
  end
end