# frozen_string_literal: true

require 'csv'
require 'ostruct'
require 'date'
@movies_file_path = ARGV.first || './movies.txt'
MOVIES_DESCRIPTION_KEYS = %i[url title year country date genre runtime rating producer actors].freeze
RATING_START_POINT = 8.0
COUNTRY_FILTER_WORD = 'USA'
MONTHNAMES = Date::MONTHNAMES.compact
def movies_list(path)
  CSV.read(path, row_sep: "\n", col_sep: '|')
end

def description_for_movie(movie)
  OpenStruct.new Hash[MOVIES_DESCRIPTION_KEYS.zip(movie)]
end

def get_movie_info(movie)
  genre_with_divider = movie.genre.tr(',', '/')
  "#{movie.title}(#{movie.date}; #{genre_with_divider}) - #{movie.runtime}"
end

def get_movies_description(movies)
  movies.map { |movie| description_for_movie movie }
end

def show_movies_stats(movies)
  MONTHNAMES.each do |month_name|
    quantity_movies = movies.count do |movie|
      Date.strptime(movie.date, '%Y-%m').strftime('%B') == month_name
    end
    puts "In #{month_name} was filmed #{quantity_movies}"
  end
end

movies = get_movies_description movies_list @movies_file_path
show_movies_stats movies
