# frozen_string_literal: true

require_relative 'movies_collection.rb'

# Netflix onlain cinema
class Netflix < MoviesCollection
  def initialize(path)
    super(path)
    @deposit = 0
  end

  attr_reader :deposit

  def show(**filter)
    movie = filter(filter).sample
    raise ArgumentError, 'Film not found' unless movie
    raise ArgumentError, 'Need more gold' if @deposit < movie.cost
    @deposit -= movie.cost
    "Now showing: #{movie.title} some period"
  end

  def pay(cash)
    @deposit += cash
  end

  def how_much?(title)
    @collection.find { |movie| movie.title.eql?(title) }
               .cost
  end
end
