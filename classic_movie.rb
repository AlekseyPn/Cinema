# frozen_string_literal: true

require_relative 'movie.rb'

# Classic movie
class ClassicMovie < Movie
  def initialize(movie, collection)
    super(movie, collection)
    @period = :classic
  end

  def cost
    1.5
  end

  def to_s
    "#{@title} is classic movie, director of this movie #{@producer} (Movie list have #{@collection.stats(:producer)[@producer]} more movie of those director)"
  end
end
