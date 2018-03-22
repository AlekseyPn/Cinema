# frozen_string_literal: true

require_relative 'movies_collection.rb'
require_relative 'movie.rb'
require 'factory_bot'
require 'ffaker'

FactoryBot.define do
  factory :movies_collection do
    model :movie
    collection []
    initialize_with { new('link') }
  end 
  factory :movie do
    url 'url'
    title 'title'
    year '2014'
    country 'USA'
    date '19.03.2018'
    genre 'comedy'
    runtime '140min'
    rating '8.3'
    producer 'Darabont'
    actors 'asdasd'
    movie_collection []
    initialize_with { new(attributes, []) }
  end
end

test = FactoryBot.create(:movie)

# `@movies_file_path = './movies.txt'
# RSpec.describe MoviesCollection do
#   it 'init collection' do
#     movies = MoviesCollection.new('./movies.txt')
#     expect(movies.all).not_to be_empty
#   end
#   it '.stats?' do
#     movies = MoviesCollection.new('./movies.txt')
#     expect(movies.stats(:producer)).not_to be_empty    
#   end
#   it 'not .contains_genre?' do
#     movies = MoviesCollection.new('./movies.txt')
#     expect(movies.contains_genre?('non-exitent genre')).to be false
#   end
#   it '.contains_genre?' do
#     movies = MoviesCollection.new('./movies.txt')
#     expect(movies.contains_genre?('Comedy')).to be true
#   end
# end`
