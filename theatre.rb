# frozen_string_literal: true

require_relative 'movies_collection.rb'

class Theatre < MoviesCollection
  def initialize(path)
    super(path)
  end
end
