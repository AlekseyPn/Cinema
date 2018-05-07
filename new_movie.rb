# frozen_string_literal: true

require_relative 'movie.rb'
require 'date'
# New movie
class NewMovie < Movie
  def initialize(movie, collection)
    super(movie, collection)
    @period = :new
  end

  def cost
    5
  end

  def to_s
    now_date = Date.today
    years_ago = (now_date - movie.date).to_i * 365
    "#{movie.title} is new movie, the movie was make #{years_ago} years ago"
  end
end
