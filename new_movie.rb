# frozen_string_literal: true

require_relative 'movie.rb'

# New movie
class NewMovie < Movie
  def initialize(movie, collection)
    super(movie, collection)
    @period = :new
  end

  def cost
    5
  end
end
