# frozen_string_literal: true

require 'date'
DATE_LENGTH = 3

# for create movie
class Movie
  attr_reader :url, :title, :year, :country, :date, :genre, :runtime, :rating, :producer, :actors

  def initialize(movie, collection)
    @url = movie.url
    @title = movie.title
    @year = movie.year
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
    date_parts.join('-')
  end

  def match_filter?(filter)
    filter.all? do |filter_key, filter_value|
      send(filter_key)
        .split(',')
        .any? { |value| value.eql?(filter_value) }
    end
  end

  def to_s
    date = Date._parse(@date)
    "Title: #{@title}, Date: #{date[:mday]} #{date[:mon]} #{date[:year]}, producer: #{@producer}, actors: #{@actors}, genre: #{@genre}"
  end
end
