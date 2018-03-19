# frozen_string_literal: true

require './movies_collection.rb'

@movies_file_path = './movies.txt'
RSpec.describe MoviesCollection do
  it 'init collection' do
    movies = MoviesCollection.new('./movies.txt')
    expect(movies.all).not_to be_empty
  end
  it '.stats?' do
    movies = MoviesCollection.new('./movies.txt')
    expect(movies.stats(:producer)).not_to be_empty    
  end
  it 'not .contains_genre?' do
    movies = MoviesCollection.new('./movies.txt')
    expect(movies.contains_genre?('non-exitent genre')).to be false
  end
  it '.contains_genre?' do
    movies = MoviesCollection.new('./movies.txt')
    expect(movies.contains_genre?('Comedy')).to be true
  end
end
