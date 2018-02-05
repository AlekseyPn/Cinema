# frozen_string_literal: true

@movies_file_path = ARGV.first || './movies.txt'
MOVIES_DESCRIPTION_KEYS = %w[url title year_of_release country date genre timing rating producer actors].freeze
RATING_START_POINT = 8.0
FILTERED_WORD = 'Max'
def read_movies_list(path)
  File.read(path)
end

def read_filename(path)
  File.basename(path)
end

def map_movies_lines(file)
  file.lines.to_a.map { |line| line.split('|') }
end

def parse_movie_description(movie)
  Hash[*[MOVIES_DESCRIPTION_KEYS, movie].transpose.flatten]
end

def check_stars_by_rating(rating)
  '*' * ((rating.to_f - RATING_START_POINT) * 10)
end

def update_rating_value(movie)
  movie.update('rating' => movie['rating']) do |_key, _old, new|
    check_stars_by_rating new
  end
end

def show_movies_by_filter(file)
  puts "Movies file: #{read_filename @movies_file_path}"
  map_movies_lines(file)
    .map { |movie| parse_movie_description movie }
    .select { |movie| movie['title'].include?(FILTERED_WORD) }
    .each do |movie|
      update_rating_value movie
      puts "Movie: #{movie['title']}]\nRating: #{movie['rating']}"
    end
end

show_movies_by_filter read_movies_list @movies_file_path
