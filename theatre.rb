# frozen_string_literal: true

require_relative 'movies_collection.rb'

# Movie in theatre
class Theatre < MovieCollection
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

  DAY_PERIODS = {
    morning: 'morning',
    day: 'day',
    evening: 'evening'
  }.freeze

  def show(time)
    hour = time.split(':').first.to_i
    filters_for_movie = MOVIES_PROGRAM.detect { |program| program[:hours].cover?(hour) }[:filter]
    movie = filter(filters_for_movie).sample
    raise ArgumentError, 'Film not found' unless movie
    write_description(movie)
  end

  def when?(movie_name)
    movie = filter(title: movie_name).sample
    raise ArgumentError, 'Film not found' unless movie
    period = case movie.period
             when :ancient then MOVIES_PROGRAM.first
             else period_by_movie(movie)
             end
    "You can watch #{movie.title} in the #{DAY_PERIODS[period[:time]]} from #{period[:hours].first} to #{period[:hours].last}"
  end

  private

  def period_by_movie(movie)
    MOVIES_PROGRAM.select { |program| program[:filter][:period].nil? }
                  .detect do |program|
      movie.genre.split(',')
           .any? { |genre| program[:filter][:genre].include?(genre) }
    end
  end
end
