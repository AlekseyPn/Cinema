# frozen_string_literal: true

require_relative 'movie.rb'

# Moder movie
class ModernMovie < Movie
  def initialize(movie, collection)
    super(movie, collection)
    @period = :modern
  end

  def cost
    3
  end
end
