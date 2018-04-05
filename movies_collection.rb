# frozen_string_literal: true

require 'csv'
require 'ostruct'
require_relative 'movie.rb'
MOVIES_DESCRIPTION_KEYS = %i[url title year country date genre runtime rating producer actors].freeze

#
class MoviesCollection
  def initialize(file_name)
    @model = Movie
    @collection = get_movies_description movies_list file_name
  end

  def all
    @collection
  end

  def sort_by(sort_key)
    @collection.sort_by { |movie| movie.send(sort_key) }
  end

  def filter(**filter)
    @collection.select do |movie|
      movie.match_filter?(filter)
    end
  end

  def stats(key_for_stats)
    collection_by_key(key_for_stats)
      .each_with_object(Hash.new(0)) { |item, obj| obj[:"#{item}"] += 1 }
  end

  def contains_genre?(genre)
    collection_by_key(:genre)
      .uniq
      .include?(genre)
  end

  private

  def movies_list(path)
    CSV.read(path, row_sep: "\n", col_sep: '|')
  end

  def description_for_movie(movie)
    OpenStruct.new Hash[MOVIES_DESCRIPTION_KEYS.zip(movie)]
  end

  def get_movies_description(movies)
    movies.map { |movie| @model.new(description_for_movie(movie), self) }
  end

  def count_by_key(key_for_count, current_movie)
    @collection.count do |movie|
      movie[key_for_count].eql(current_movie.send(key_for_stats))
    end
  end

  def collection_by_key(key)
    @collection.collect { |movie| movie.send(key).split(',') }
               .flatten
  end
end
