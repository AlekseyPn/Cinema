# frozen_string_literal: true

@movies_file_path = ARGV.first || './movies.txt'
MOVIES_DESCRIPTION_KEYS = %w[url title year_of_release country date genre timing rating producer actors].freeze
RATING_START_POINT = 8.0
FILTERED_WORD = 'Max'
def movies_list(path)
  File.read(path)
end

def read_filename(path)
  File.basename(path)
end

def get_movies_description(file)
  file.lines.to_a.map { |line| line.split('|') }
end

def description_for_movie(movie)
  Hash[*[MOVIES_DESCRIPTION_KEYS, movie].transpose.flatten]
end

def count_stars_via_rating(rating)
  '*' * ((rating.to_f - RATING_START_POINT) * 10)
end

def update_rating_value(movie)
  movie.update('rating' => movie['rating']) do |_key, _old, new|
    count_stars_via_rating new
  end
end

def show_movies_of_file(file)
  puts "Movies file: #{read_filename @movies_file_path}"
  get_movies_description(file)
    .map { |movie| description_for_movie movie }
    .select { |movie| movie['title'].include?(FILTERED_WORD) }
    .each do |movie|
      update_rating_value movie
      puts "Movie: #{movie['title']}]\nRating: #{movie['rating']}"
    end
end

show_movies_of_file movies_list @movies_file_path
