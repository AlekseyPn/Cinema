# frozen_string_literal: true

require_relative 'movies_collection.rb'
require 'date'
@movies_file_path = ARGV.first || 'movies.txt'
movies = MoviesCollection.new(@movies_file_path)

date = DateTime.now
calc = 146/(24*60).to_f
puts calc
puts (date+calc).to_s