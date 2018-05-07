# frozen_string_literal: true

require_relative 'movie.rb'

# Ancient movie
class AncientMovie < Movie
  def initialize(movie, collection)
    super(movie, collection)
    @period = :ancient
  end
  
  def cost
    1
  end

  def to_s
    "#{@title} is old movie (#{@year})"
  end
end
