# frozen_string_literal: true

# for create movie
class Movie
  require 'date'
  require_relative 'ancient_movie.rb'
  require_relative 'classic_movie.rb'
  require_relative 'modern_movie.rb'
  require_relative 'new_movie.rb'

  DATE_LENGTH = 3
  MOVIE_TYPES = {
    1900..1945 => AncientMovie,
    1945..1968 => ClassicMovie,
    1968..2000 => ModernMovie,
    2000..9999 => NewMovie
  }.freeze

  attr_reader :url, :title, :year, :country, :date, :genre, :runtime, :rating, :producer, :actors, :period

  def initialize(movie, collection)
    @url = movie.url
    @title = movie.title
    @year = movie.year.to_i
    @country = movie.country
    @date = day?(movie.date)
    @genre = movie.genre
    @runtime = movie.runtime
    @rating = movie.rating
    @producer = movie.producer
    @actors = movie.actors
    @movie_collection = collection
  end

  def genre?(genre)
    raise ArgumentError, 'The movies collection does\'nt have genre' unless @movie_collection.contains_genre?(genre)
    @genre.casecmp(genre)
  end

  def day?(date)
    date_parts = date.split('-')
    date_parts.push('01') if date_parts.length != DATE_LENGTH
    Date.parse(date_parts.join('-'))
  end

  def match_filter?(filter)
    filter.all? do |filter_key, filter_value|
      value = send(filter_key)
      if filter_key.to_s == 'period'
        value.eql?(filter_value)
      else
        value.split(',')
             .any? { |item| item.eql?(filter_value) }
      end
    end
  end

  def self.create(movie, collection)
    _, movie_class = MOVIE_TYPES.detect { |year, _period| year.cover?(movie.year.to_i) }
    raise ArgumentError, 'Imposible to determine period' unless movie_class
    movie_class.new(movie, collection)
  end

  # TODO: Для каждого периода нужно свое описание к фильму
  def to_s
    "Title: #{@title}, Date: #{@date.mday} #{@date.mon} #{@date.year}, producer: #{@producer}, actors: #{@actors}, genre: #{@genre}"
  end
end
