# frozen_string_literal: true

@movies_file_path = ARGV.first || './movies.txt'
MOVIES_DESCRIPTION_KEYS = %i[url title year country date genre timing rating producer actors].freeze
RATING_START_POINT = 8.0
COUNTRY_FILTER_WORD = 'USA'
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
  movie.update(rating: movie[:rating]) do |_key, _old, new|
    count_stars_via_rating new
  end
end

def get_most_long_movies(movies)
  movies.max_by(5) { |movie| movie[:timing].to_i }
end

def first_ten_comedies(movies)
  movies.select { |movie| movie[:genre]['Comedy'] }
        .max(10) do |a, b|
          b[:year] <=> a[:year]
        end
end

def producer_names(movies)
  movies.map { |movie| movie[:producer] }
        .sort_by { |producer| producer.split.last.chr }
        .uniq
end

def quantity_not_american_movies(movies)
  movies_quantity = movies.count do |movie|
    movie[:country] != COUNTRY_FILTER_WORD
  end
  puts "Quantity movies filmed not in the USA: #{movies_quantity}"
end

def get_movie_info(movie)
  genre_with_divider = movie[:genre].tr(',', '/')
  "#{movie[:title]}(#{movie[:date]}; #{genre_with_divider}) - #{movie[:timing]}"
end

def show_movies_info(movies)
  movies
    .map { |movie| get_movie_info movie }
    .join("\n")
end

def show_most_long_movies(movies)
  puts "Five most long movies from top:\n #{show_movies_info get_most_long_movies movies}"
end

def show_first_ten_comedies(movies)
  puts "First ten comedies by year:\n #{show_movies_info first_ten_comedies movies}"
end

def show_producers(movies)
  puts "Producers filtered by alphabet: #{producer_names(movies).join("\n")}"
end

def get_movies_of_file(movies)
  get_movies_description(movies)
    .map { |movie| description_for_movie movie }
end
movies = get_movies_of_file movies_list @movies_file_path
show_most_long_movies movies
show_first_ten_comedies movies
show_producers movies
quantity_not_american_movies movies
