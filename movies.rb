# frozen_string_literal: true

DESCRIPTION_PATH = './movies_description.txt'
MOVIES_DESCRIPTION_KEYS = %w[url title year_of_release country date genre timing rating producer actors].freeze
RATING_START_POINT = 8.0
FILTERED_WORD = 'Max'
def get_movies_top(path)
  File.read(path)
end

def get_file_name(path)
  File.basename(path)
end

def get_movies_list(file)
  file.lines.to_a.map { |line| line.split('|') }
end

def get_movie_description(movie)
  Hash[*[MOVIES_DESCRIPTION_KEYS, movie].transpose.flatten]
end

def get_rating_value(rating)
  puts rating.to_f
  '*' * ((rating.to_f - RATING_START_POINT) * 10)
end

def init_filtered_top(file)
  get_movies_list(file)
    .map { |movie| get_movie_description movie }
    .select { |movie| movie['title'].include?(FILTERED_WORD) }
    .each do |movie|
      movie.update('rating' => movie['rating']) { |_key, _old, new| get_rating_value new }
    end
end

p init_filtered_top get_movies_top DESCRIPTION_PATH
