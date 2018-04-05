# frozen_string_literal: true

require_relative 'movies_collection.rb'
@movies_file_path = ARGV.first || './movies.txt'
movies = MoviesCollection.new(@movies_file_path)

# puts movies.filter(genre: 'Comedy')
puts movies.stats(:producer)
# puts movies.sort_by(:date)
