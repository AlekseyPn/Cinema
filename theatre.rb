# frozen_string_literal: true

require_relative 'movies_collection.rb'

# Movie in theatre
class Theatre < MoviesCollection
  def initialize(path)
    super(path)
  end

  MOVIES_PROGRAM = [
    {
      time: :morning,
      hours: 6..12,
      filter: { period: :ancient }
    },
    {
      time: :day,
      hours: 12..17,
      filter: {
        genre: %w[Comedy Adventure]
      }
    },
    {
      time: :evening,
      hours: 17..24,
      filter: {
        genre: %w[Drama Horror]
      }
    }
  ].freeze

  def show(time)
    hour = time.split(':').first.to_i
    filters_for_movie = MOVIES_PROGRAM.detect { |program| program[:hours].cover?(hour) }[:filter]
    movie = filter(filters_for_movie).sample
    write_description(movie)
  end
end
