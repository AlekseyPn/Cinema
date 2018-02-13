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
        .sort_by { |producer| producer.split.last[0] }
        .uniq
end

def quantity_not_american_movies(movies)
  puts 'Quantity movies filmed not in the USA:'
  puts movies.count { |movie| movie[:country] != COUNTRY_FILTER_WORD }
end

def get_movie_info(movie)
  "#{movie[:title]}(#{movie[:date]}; #{movie[:genre].tr(',', '/')}) - #{movie[:timing]}"
end

def show_movies_info(movies)
  movies.each do |movie|
    puts get_movie_info movie
  end
end

def show_most_long_movies(movies)
  puts 'Five most long movies from top:'
  show_movies_info get_most_long_movies movies
end

def show_first_ten_comedies(movies)
  puts 'First ten comedies by year:'
  show_movies_info first_ten_comedies movies
end

def show_producers(movies)
  puts 'Producers filtered by alphabet:'
  producer_names(movies)
    .each do |producer|
      puts producer
    end
end

def show_movies_of_file(movies)
  movies = get_movies_description(movies)
           .map { |movie| description_for_movie movie }
  show_most_long_movies movies
  show_first_ten_comedies movies
  quantity_not_american_movies movies
end

show_movies_of_file movies_list @movies_file_path
